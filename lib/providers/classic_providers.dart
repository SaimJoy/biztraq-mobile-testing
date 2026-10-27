import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/api_config.dart';
import '../data/greeting_repository.dart';

/// Shared by classic providers and `@riverpod` providers.
/// Tests override this one provider for both styles.
final greetingRepositoryProvider = Provider<GreetingRepository>(
  (ref) => ApiGreetingRepository(ApiConfig.baseUrl),
);

final greetingProvider = Provider<String>(
  (ref) => ref.watch(greetingRepositoryProvider).greeting(),
);

final messageProvider = FutureProvider<String>(
  (ref) => ref.watch(greetingRepositoryProvider).fetchMessage(),
);

class MessageNotifier extends AsyncNotifier<String> {
  @override
  Future<String> build() {
    return ref.watch(greetingRepositoryProvider).fetchMessage();
  }
}

final messageNotifierProvider =
    AsyncNotifierProvider<MessageNotifier, String>(MessageNotifier.new);

class Counter extends Notifier<int> {
  @override
  int build() => 0;

  void increment() => state++;
}

final counterProvider = NotifierProvider<Counter, int>(Counter.new);
