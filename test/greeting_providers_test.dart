import 'package:biztraq_mobile/data/greeting_repository.dart';
import 'package:biztraq_mobile/providers/classic_providers.dart';
import 'package:biztraq_mobile/providers/generated_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('classic and generated providers share one repository override', () async {
    final container = ProviderContainer(
      overrides: [
        greetingRepositoryProvider.overrideWithValue(FakeGreetingRepository()),
      ],
    );
    addTearDown(container.dispose);

    expect(container.read(greetingProvider), 'fake hello');
    expect(container.read(generatedGreetingProvider), 'fake hello');

    expect(await container.read(messageProvider.future), 'fake async');
    expect(await container.read(messageNotifierProvider.future), 'fake async');
    expect(await container.read(generatedMessageProvider.future), 'fake async');
  });
}
