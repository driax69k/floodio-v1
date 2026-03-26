// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trusted_sender_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TrustedSendersController)
final trustedSendersControllerProvider = TrustedSendersControllerProvider._();

final class TrustedSendersControllerProvider
    extends
        $StreamNotifierProvider<
          TrustedSendersController,
          List<TrustedSenderEntity>
        > {
  TrustedSendersControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'trustedSendersControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$trustedSendersControllerHash();

  @$internal
  @override
  TrustedSendersController create() => TrustedSendersController();
}

String _$trustedSendersControllerHash() =>
    r'ab9c85f52532caa795060e95d48282b564c7c689';

abstract class _$TrustedSendersController
    extends $StreamNotifier<List<TrustedSenderEntity>> {
  Stream<List<TrustedSenderEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<TrustedSenderEntity>>,
              List<TrustedSenderEntity>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<TrustedSenderEntity>>,
                List<TrustedSenderEntity>
              >,
              AsyncValue<List<TrustedSenderEntity>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
