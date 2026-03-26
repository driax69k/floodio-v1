// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hazard_marker_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HazardMarkersController)
final hazardMarkersControllerProvider = HazardMarkersControllerProvider._();

final class HazardMarkersControllerProvider
    extends
        $StreamNotifierProvider<
          HazardMarkersController,
          List<HazardMarkerEntity>
        > {
  HazardMarkersControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hazardMarkersControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hazardMarkersControllerHash();

  @$internal
  @override
  HazardMarkersController create() => HazardMarkersController();
}

String _$hazardMarkersControllerHash() =>
    r'dd46ba7f3e5a66ebe4de477c0d510788ff8c9b06';

abstract class _$HazardMarkersController
    extends $StreamNotifier<List<HazardMarkerEntity>> {
  Stream<List<HazardMarkerEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<HazardMarkerEntity>>,
              List<HazardMarkerEntity>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<HazardMarkerEntity>>,
                List<HazardMarkerEntity>
              >,
              AsyncValue<List<HazardMarkerEntity>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
