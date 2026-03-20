# Drift & Riverpod Generator: Integration Guide

This document outlines the specific interactions, patterns, and best practices for using **Drift** (a reactive persistence library for SQLite/Postgres) alongside **Riverpod** (a reactive caching and data-binding framework) using **`riverpod_generator`**. 

Because both libraries are highly reactive and rely on code generation, they synergize perfectly. Drift's auto-updating queries (`.watch()`) map directly to Riverpod's asynchronous providers (`StreamProvider` / `StreamNotifier`).

---

## 1. Providing the Database Instance

The Drift database should be instantiated once and shared across the app. Use a `@Riverpod(keepAlive: true)` provider to expose it. 

**Crucial Step:** Always use `ref.onDispose()` to close the database connection when the provider is destroyed (e.g., during testing or app teardown).

```dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'database.dart'; // Your Drift database class

part 'database_provider.g.dart';

@Riverpod(keepAlive: true)
AppDatabase database(Ref ref) {
  // Instantiate the Drift database
  final db = AppDatabase();
  
  // Ensure the database connection is closed when the provider is disposed
  ref.onDispose(db.close);
  
  return db;
}
```

---

## 2. Exposing Drift Queries (Reads)

Drift provides two main ways to read data: one-time reads (`.get()`) and reactive streams (`.watch()`). Riverpod handles both seamlessly.

### A. Reactive Streams (Recommended)
Drift's `.watch()` returns a `Stream` that automatically emits a new list of rows whenever the underlying tables change. By returning this `Stream` in a `@riverpod` function, Riverpod automatically converts it into an `AsyncValue` for the UI.

```dart
@riverpod
Stream<List<Todo>> watchTodos(Ref ref) {
  // 1. Watch the database provider
  final db = ref.watch(databaseProvider);
  
  // 2. Return the Drift stream
  return db.select(db.todos).watch();
}
```

### B. One-Time Reads (Futures)
If you only need to fetch data once (e.g., for a specific calculation or a screen that doesn't need live updates), use `.get()` or `.getSingle()`.

```dart
@riverpod
Future<Todo> getTodoById(Ref ref, int id) {
  final db = ref.watch(databaseProvider);
  
  return (db.select(db.todos)..where((t) => t.id.equals(id))).getSingle();
}
```

---

## 3. Performing Mutations (Writes)

Because Drift's `.watch()` streams automatically react to table changes, **you do not need to manually update Riverpod state after a database write**. 

When you insert, update, or delete a row in Drift, any active `.watch()` streams listening to that table will automatically emit new data, and Riverpod will automatically rebuild the dependent UI.

### Pattern 1: Simple Functions (Stateless Writes)
For simple apps, you can just read the database provider and execute the query.

```dart
// In a widget or a controller:
void addTodo(WidgetRef ref, String title) async {
  final db = ref.read(databaseProvider);
  await db.into(db.todos).insert(TodosCompanion.insert(title: title));
  // The `watchTodosProvider` will automatically emit the new list!
}
```

### Pattern 2: Using `StreamNotifier` (Stateful Writes)
For more complex logic, group the reactive read and the mutations together using a Riverpod `StreamNotifier` (via `@riverpod` class syntax).

```dart
@riverpod
class TodosController extends _$TodosController {
  @override
  Stream<List<Todo>> build() {
    final db = ref.watch(databaseProvider);
    // The state of this Notifier is the live stream of Todos
    return db.select(db.todos).watch();
  }

  Future<void> addTodo(String title) async {
    final db = ref.read(databaseProvider);
    
    // Perform the mutation
    await db.into(db.todos).insert(TodosCompanion.insert(title: title));
    
    // Note: We DO NOT modify `state` manually here.
    // Drift handles the reactivity; the `build` stream will emit a new value,
    // which Riverpod will automatically catch and update the UI.
  }

  Future<void> deleteTodo(int id) async {
    final db = ref.read(databaseProvider);
    await (db.delete(db.todos)..where((t) => t.id.equals(id))).go();
  }
}
```

---

## 4. Advanced Interactions

### Combining Drift Streams with Riverpod State
You can easily filter or modify Drift queries based on other Riverpod state (e.g., a search query or a filter enum).

```dart
// 1. A simple state provider for the current filter
@riverpod
class SearchQuery extends _$SearchQuery {
  @override
  String build() => '';
  
  void update(String query) => state = query;
}

// 2. A Drift query that reacts to the search query
@riverpod
Stream<List<Todo>> filteredTodos(Ref ref) {
  final db = ref.watch(databaseProvider);
  final searchQuery = ref.watch(searchQueryProvider);
  
  final query = db.select(db.todos);
  
  if (searchQuery.isNotEmpty) {
    query.where((t) => t.title.like('%$searchQuery%'));
  }
  
  return query.watch();
}
```
*How it works:* When `searchQueryProvider` changes, `filteredTodosProvider` is invalidated and re-runs. It creates a *new* Drift stream with the new `WHERE` clause. Riverpod handles disposing of the old stream and listening to the new one automatically.

### Testing: Overriding the Database
Riverpod makes it trivial to swap out a real SQLite database for an in-memory Drift database during testing.

```dart
import 'package:drift/native.dart';

void main() {
  testWidgets('Todo test', (tester) async {
    // Create an in-memory Drift database
    final inMemoryDb = AppDatabase(NativeDatabase.memory());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          // Override the Riverpod provider to return the in-memory DB
          databaseProvider.overrideWithValue(inMemoryDb),
        ],
        child: const MyApp(),
      ),
    );

    // Run tests...
    
    // Clean up
    await inMemoryDb.close();
  });
}
```

---

## 5. Best Practices & Gotchas

1. **Use `ref.watch` for the Database Provider:** 
   Always use `final db = ref.watch(databaseProvider);` inside your query providers. Even though the database instance rarely changes, using `watch` ensures that if the database provider *is* ever recreated (e.g., during a user logout/login sequence where the DB is wiped), all dependent queries will automatically re-subscribe to the new database instance.
2. **Do not manually cache Drift Streams:** 
   Riverpod's `@riverpod` handles caching the stream and its latest emitted value. Do not store the `Stream` in a variable manually.
3. **Transactions and Riverpod:**
   If you need to perform a Drift `transaction`, do it inside a Notifier method. Do not attempt to expose a `transaction` object via a Riverpod provider, as transactions are short-lived and asynchronous.
4. **Avoid `ref.read` in `build()`:**
   Never use `ref.read(databaseProvider)` inside a provider's `build()` method or a functional provider. Always use `ref.watch`. Reserve `ref.read` for callbacks/mutations (like `onPressed` handlers or Notifier methods).