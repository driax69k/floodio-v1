# Riverpod

A reactive caching and data-binding framework. https://riverpod.dev
Riverpod makes working with asynchronous code a breeze by:

- Handling errors/loading states by default. No need to manually catch errors
- Natively supporting advanced scenarios, such as pull-to-refresh
- Separating the logic from your UI
- Ensuring your code is testable, scalable and reusable

Long story short:

- Define network requests by writing a function annotated with `@riverpod`:

  ```dart
  @riverpod
  Future<String> boredSuggestion(Ref ref) async {
    final response = await http.get(
      Uri.https('boredapi.com', '/api/activity'),
    );
    final json = jsonDecode(response.body);
    return json['activity']! as String;
  }
  ```

- Listen to the network request in your UI and gracefully handle loading/error states.

  ```dart
  class Home extends ConsumerWidget {
    @override
    Widget build(BuildContext context, WidgetRef ref) {
      final boredSuggestion = ref.watch(boredSuggestionProvider);
      // Perform a switch-case on the result to handle loading/error states
      return switch (boredSuggestion) {
        AsyncData(:final value) => Text('data: $value'),
        AsyncError(:final error) => Text('error: $error'),
        _ => const Text('loading'),
      };
    }
  }
  ```