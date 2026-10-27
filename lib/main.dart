import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'config/api_config.dart';
import 'providers/classic_providers.dart';
import 'providers/generated_providers.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biztraq',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final message = ref.watch(messageProvider);
    final generated = ref.watch(generatedMessageProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Biztraq')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(ApiConfig.baseUrl, key: const Key('apiBaseUrl')),
            Text(ref.watch(greetingProvider), key: const Key('greeting')),
            Text(
              ref.watch(generatedGreetingProvider),
              key: const Key('generatedGreeting'),
            ),
            message.when(
              data: (value) => Text(value, key: const Key('message')),
              loading: () => const CircularProgressIndicator(),
              error: (error, _) => Text('$error'),
            ),
            generated.when(
              data: (value) => Text(value, key: const Key('generatedMessage')),
              loading: () => const SizedBox.shrink(),
              error: (error, _) => Text('$error'),
            ),
            Text(
              '${ref.watch(counterProvider)}',
              key: const Key('counterText'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('increment'),
        onPressed: () => ref.read(counterProvider.notifier).increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
