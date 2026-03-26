// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CryptoService)
final cryptoServiceProvider = CryptoServiceProvider._();

final class CryptoServiceProvider
    extends $AsyncNotifierProvider<CryptoService, void> {
  CryptoServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cryptoServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cryptoServiceHash();

  @$internal
  @override
  CryptoService create() => CryptoService();
}

String _$cryptoServiceHash() => r'5266ab2b23c289bbb6a6dd6d2e90c8e1121be591';

abstract class _$CryptoService extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
