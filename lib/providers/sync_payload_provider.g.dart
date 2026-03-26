// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_payload_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SyncPayloadsController)
final syncPayloadsControllerProvider = SyncPayloadsControllerProvider._();

final class SyncPayloadsControllerProvider
    extends
        $StreamNotifierProvider<
          SyncPayloadsController,
          List<SyncPayloadEntity>
        > {
  SyncPayloadsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'syncPayloadsControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$syncPayloadsControllerHash();

  @$internal
  @override
  SyncPayloadsController create() => SyncPayloadsController();
}

String _$syncPayloadsControllerHash() =>
    r'f1a34fe9226fd129fb5d90d6f49dda0e875b5886';

abstract class _$SyncPayloadsController
    extends $StreamNotifier<List<SyncPayloadEntity>> {
  Stream<List<SyncPayloadEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<SyncPayloadEntity>>,
              List<SyncPayloadEntity>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<SyncPayloadEntity>>,
                List<SyncPayloadEntity>
              >,
              AsyncValue<List<SyncPayloadEntity>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
