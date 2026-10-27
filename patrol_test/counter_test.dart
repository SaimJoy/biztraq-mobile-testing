import 'package:biztraq_mobile/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

void main() {
  patrolTest('counter survives leaving the app', ($) async {
    await $.pumpWidgetAndSettle(
      const ProviderScope(child: MyApp()),
    );

    expect($(#apiBaseUrl), findsOneWidget);
    await $(#increment).tap();
    expect($(#counterText).text, '1');

    await $.platform.mobile.pressHome();
    await $.platform.mobile.openApp();

    expect($(#counterText).text, '1');
  });
}
