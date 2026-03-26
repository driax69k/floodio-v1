// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seen_message_id_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SeenMessageIdsController)
final seenMessageIdsControllerProvider = SeenMessageIdsControllerProvider._();

final class SeenMessageIdsControllerProvider
    extends
        $StreamNotifierProvider<
          SeenMessageIdsController,
          List<SeenMessageIdEntity>
        > {
  SeenMessageIdsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'seenMessageIdsControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$seenMessageIdsControllerHash();

  @$internal
  @override
  SeenMessageIdsController create() => SeenMessageIdsController();
}

String _$seenMessageIdsControllerHash() =>
    r'88b95d1429620bd3a1d775e8856e05bc5b92b67a';

abstract class _$SeenMessageIdsController
    extends $StreamNotifier<List<SeenMessageIdEntity>> {
  Stream<List<SeenMessageIdEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<SeenMessageIdEntity>>,
              List<SeenMessageIdEntity>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<SeenMessageIdEntity>>,
                List<SeenMessageIdEntity>
              >,
              AsyncValue<List<SeenMessageIdEntity>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
