import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'classic_providers.dart';

part 'generated_providers.g.dart';

@riverpod
String generatedGreeting(Ref ref) {
  return ref.watch(greetingRepositoryProvider).greeting();
}

@riverpod
class GeneratedMessage extends _$GeneratedMessage {
  @override
  Future<String> build() {
    return ref.watch(greetingRepositoryProvider).fetchMessage();
  }
}
