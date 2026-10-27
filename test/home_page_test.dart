import 'package:biztraq_mobile/data/greeting_repository.dart';
import 'package:biztraq_mobile/main.dart';
import 'package:biztraq_mobile/providers/classic_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('home page uses the overridden repository', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          greetingRepositoryProvider.overrideWithValue(
            FakeGreetingRepository(),
          ),
        ],
        child: const MyApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('fake hello'), findsNWidgets(2));
    expect(find.text('fake async'), findsNWidgets(2));
    expect(find.byKey(const Key('apiBaseUrl')), findsOneWidget);

    await tester.tap(find.byKey(const Key('increment')));
    await tester.pump();
    expect(find.text('1'), findsOneWidget);
  });
}
