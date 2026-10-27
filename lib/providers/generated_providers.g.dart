// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generated_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(generatedGreeting)
final generatedGreetingProvider = GeneratedGreetingProvider._();

final class GeneratedGreetingProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  GeneratedGreetingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'generatedGreetingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$generatedGreetingHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return generatedGreeting(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$generatedGreetingHash() => r'9f4ae755a4942962effc22f4625b4879ad274431';

@ProviderFor(GeneratedMessage)
final generatedMessageProvider = GeneratedMessageProvider._();

final class GeneratedMessageProvider
    extends $AsyncNotifierProvider<GeneratedMessage, String> {
  GeneratedMessageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'generatedMessageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$generatedMessageHash();

  @$internal
  @override
  GeneratedMessage create() => GeneratedMessage();
}

String _$generatedMessageHash() => r'ac966c58a41b709af4e222d2d43e3e00d9f57eef';

abstract class _$GeneratedMessage extends $AsyncNotifier<String> {
  FutureOr<String> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<String>, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<String>, String>,
              AsyncValue<String>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
