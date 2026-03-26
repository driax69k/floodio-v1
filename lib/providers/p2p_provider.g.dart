// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(P2pService)
final p2pServiceProvider = P2pServiceProvider._();

final class P2pServiceProvider extends $NotifierProvider<P2pService, P2pState> {
  P2pServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'p2pServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$p2pServiceHash();

  @$internal
  @override
  P2pService create() => P2pService();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(P2pState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<P2pState>(value),
    );
  }
}

String _$p2pServiceHash() => r'2500935ca8358fc1f50588d2bd3abbc43e4e23bd';

abstract class _$P2pService extends $Notifier<P2pState> {
  P2pState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<P2pState, P2pState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<P2pState, P2pState>,
              P2pState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
