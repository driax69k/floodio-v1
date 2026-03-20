# Riverpod & Riverpod Generator

## 1. Core Concepts & Syntax

Modern Riverpod uses the `@riverpod` annotation. **Do not use legacy providers** (`StateProvider`, `StateNotifierProvider`, `ChangeNotifierProvider`) in new code.

Every file using `@riverpod` must include the part file:
```dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'my_file.g.dart'; // MUST match the file name exactly
```

### A. Functional Providers (Read-Only / Async)
Use for derived state, API calls, or simple read-only values.

```dart
// Synchronous
@riverpod
String greeting(Ref ref) => 'Hello World';

// Asynchronous (Automatically exposes an AsyncValue<User>)
@riverpod
Future<User> fetchUser(Ref ref, int userId) async {
  final api = ref.watch(apiProvider);
  return api.getUser(userId);
}
```

### B. Class-Based Providers (Notifiers for Mutable State)
Use when the state needs to be modified via methods.

```dart
@riverpod
class Counter extends _$Counter {
  @override
  int build() {
    // Initial state. Can be async (Future<int> build() async {...})
    return 0; 
  }

  void increment() {
    // Mutate state by reassigning it. 
    // DO NOT mutate the existing object in memory if it's a complex type; create a new instance.
    state++; 
  }
}
```

---

## 2. Provider Modifiers & Configuration

### Passing Parameters (Families)
Simply add parameters to the function or `build` method. 
*Rule: Parameters must have a consistent `==` operator (e.g., primitive types, Freezed classes, or constant objects).*

```dart
@riverpod
Future<Product> product(Ref ref, {required String id, int limit = 50}) async { ... }
```

### Keep Alive (Disabling Auto-Dispose)
By default, all generated providers are `autoDispose`. To keep them alive:

```dart
@Riverpod(keepAlive: true)
int globalCounter(Ref ref) => 0;
```

### Scoping & Dependencies
If a provider is meant to be overridden in a scoped `ProviderScope`, you must declare its dependencies.

```dart
@Riverpod(dependencies: [])
int scopedValue(Ref ref) => throw UnimplementedError();

@Riverpod(dependencies: [scopedValue])
String derivedValue(Ref ref) {
  final val = ref.watch(scopedValueProvider);
  return val.toString();
}
```

### Raw Types (Bypassing AsyncValue)
If you want to return a `Future`, `Stream`, or `ChangeNotifier` *without* Riverpod converting it to an `AsyncValue`, wrap the return type in `Raw<T>`.

```dart
@riverpod
Raw<Future<int>> rawFuture(Ref ref) async => 42;
```

---

## 3. Consuming Providers

### Inside other Providers
Use the `Ref` object passed to the provider.

*   `ref.watch(provider)`: Reactively rebuilds the provider when the watched provider changes.
*   `ref.read(provider)`: Reads the current value without listening (rarely used inside providers, mostly for callbacks).
*   `ref.listen(provider, (prev, next) {...})`: Triggers a callback on change.

### Inside Widgets
Use `ConsumerWidget` or `ConsumerStatefulWidget`.

```dart
class MyWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the provider
    final count = ref.watch(counterProvider);
    
    // Read the notifier to call methods
    return ElevatedButton(
      onPressed: () => ref.read(counterProvider.notifier).increment(),
      child: Text('Count: $count'),
    );
  }
}
```

### Handling AsyncValue (Pattern Matching)
Riverpod 3.0 encourages Dart 3 pattern matching for `AsyncValue`.

```dart
final asyncUser = ref.watch(fetchUserProvider(1));

return switch (asyncUser) {
  AsyncData(:final value) => Text('User: ${value.name}'),
  AsyncError(:final error) => Text('Error: $error'),
  _ => const CircularProgressIndicator(),
};
```
*Note: Avoid `AsyncValue<T?>(:final value?)` if the data can legitimately be null. Use `hasValue: true` instead.*

---

## 4. Advanced Features (Riverpod 3.0+)

### Synchronous Async Combination
You can synchronously combine async providers inside the `build`/init phase using `.requireValue` (throws if loading/error).

```dart
@riverpod
Future<int> combined(Ref ref) async {
  // Wait for both to initialize
  await Future.wait([ref.watch(aProvider.future), ref.watch(bProvider.future)]);
  
  // Synchronously read them
  final a = ref.watch(aProvider).requireValue;
  final b = ref.watch(bProvider).requireValue;
  return a + b;
}
```

### Lifecycle & Disposal
*   `ref.onDispose(() {...})`: Run cleanup when the provider is destroyed.
*   `ref.onCancel(() {...})` / `ref.onResume(() {...})`: Handle pause/resume states.
*   `Ref.mounted`: Check if the provider is still active before executing async logic.

```dart
@riverpod
Future<void> doAsyncWork(Ref ref) async {
  await Future.delayed(const Duration(seconds: 2));
  if (!ref.mounted) return; // Abort if disposed during the await
  // ...
}
```

### Offline Persistence (riverpod_sqflite)
Use `persist` inside a Notifier's `build` method to automatically save/load state.

```dart
@riverpod
class Todos extends _$Todos {
  @override
  FutureOr<List<Todo>> build() async {
    await persist(
      ref.watch(storageProvider.future),
      key: 'todos',
      encode: jsonEncode,
      decode: (json) => (jsonDecode(json) as List).map(Todo.fromJson).toList(),
    ).future;
    return state.value ?? [];
  }
}
```

---

## 5. Strict Lint Rules & Anti-Patterns

When coding, **strictly adhere** to these rules enforced by `riverpod_lint`:

1.  **NEVER pass `BuildContext` to a provider.**
    *   *Bad:* `void doSomething(BuildContext context) {...}` inside a Notifier.
    *   *Good:* Handle navigation/snackbars in the Widget, or pass a callback.
2.  **NEVER define public mutable properties in a Notifier.**
    *   *Bad:* `class MyNotifier extends _$MyNotifier { int myVar = 0; ... }`
    *   *Good:* All state must be stored in the `state` property. Use private variables (`_myVar`) for internal logic only.
3.  **NEVER access another Notifier's protected properties.**
    *   *Bad:* `ref.read(otherProvider.notifier).state++`
    *   *Good:* `ref.read(otherProvider.notifier).increment()`
4.  **ALWAYS name the first parameter of a functional provider `ref`.**
    *   *Bad:* `int myProvider(Ref r) => 0;`
    *   *Good:* `int myProvider(Ref ref) => 0;`
5.  **ALWAYS extend `_$ClassName` for Notifiers.**
    *   *Bad:* `class MyNotifier extends Notifier<int>`
    *   *Good:* `class MyNotifier extends _$MyNotifier`
6.  **ALWAYS include a `build()` method in Notifiers.**
7.  **NEVER use `ref` inside `State.dispose()` of a `ConsumerStatefulWidget`.**
    *   It will cause a runtime error. Use `ref.onDispose` inside the provider instead.