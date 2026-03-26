// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_item_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NewsItemsController)
final newsItemsControllerProvider = NewsItemsControllerProvider._();

final class NewsItemsControllerProvider
    extends $StreamNotifierProvider<NewsItemsController, List<NewsItemEntity>> {
  NewsItemsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'newsItemsControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$newsItemsControllerHash();

  @$internal
  @override
  NewsItemsController create() => NewsItemsController();
}

String _$newsItemsControllerHash() =>
    r'5374c9c67d63216c2494edb449cf113fd6a4a1a5';

abstract class _$NewsItemsController
    extends $StreamNotifier<List<NewsItemEntity>> {
  Stream<List<NewsItemEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<NewsItemEntity>>, List<NewsItemEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<NewsItemEntity>>,
                List<NewsItemEntity>
              >,
              AsyncValue<List<NewsItemEntity>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
