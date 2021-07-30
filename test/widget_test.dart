import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:adopt_ta_waifu/main.dart';

void main() {
  testWidgets("show Loading Page", (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());
    final loading = find.byType(CircularProgressIndicator);
    expect(loading, findsOneWidget);
  });

}
