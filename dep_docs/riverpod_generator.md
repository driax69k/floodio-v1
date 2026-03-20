# Riverpod generator

Welcome!

This project is a side package for Riverpod, meant to offer a different syntax for defining "providers" by relying on code generation.

Without any delay, here is how you

```dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

part 'my_file.g.dart';

// Using riverpod_generator, we define Providers by annotating functions with @riverpod.
// In this example, riverpod_generator will use this function and generate a matching "fetchProductProvider".
// The following example would be the equivalent of a "FutureProvider.autoDispose.family"
@riverpod
Future<List<Product>> fetchProducts(Ref ref, {required int page, int limit = 50}) async {
  final dio = Dio();
  final response = await dio.get('https://my-api/products?page=$page&limit=$limit');
  final json = response.data! as List;
  return json.map((item) => Product.fromJson(item)).toList();
}


// Now that we defined a provider, we can then listen to it inside widgets as usual.
Consumer(
  builder: (context, ref, child) {
    AsyncValue<List<Product>> products = ref.watch(fetchProductProvider(page: 1));

    // Since our provider is async, we need to handle loading/error states
    return products.when(
      loading: () => CircularProgressIndicator(),
      error: (err, stack) => Text('error: $err'),
      data: (products) {
        return ListView(
          children: [
            for (final product in products)
              Text(product.name),
          ],
        );
      },
    );
  },
);
```

This new syntax has all the power of Riverpod, but also:

- solves the problem of knowing "What provider should I use?".  
  With this new syntax, there is no such thing as `Provider` vs `FutureProvider` vs ...
- enables stateful hot-reload for providers.  
  When modifying the source code of a provider, on hot-reload Riverpod will re-execute
  that provider _and only that provider_.
- fixes various flaws in the existing syntax.  
  For example, when passing parameters to providers by using [family], we are limited
  to a single positional parameter. But with this project, we can pass multiple parameters,
  and use all the features of function parameters. Including named parameters, optional
  parameters, default values, ...

This project is entirely optional. But if you don't mind code generation, definitely consider using it over the default Riverpod syntax.
