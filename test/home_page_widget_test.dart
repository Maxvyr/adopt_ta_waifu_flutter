import 'package:adopt_ta_waifu/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:adopt_ta_waifu/main.dart';

void main() {
  final baseApp = MediaQuery(
      data: const MediaQueryData(),
      child: MaterialApp(
        home: MyHomePage(),
      ));

  testWidgets("widget set on page", (WidgetTester tester) async {
    await tester.pumpWidget(baseApp);
    final topBar = find.byType(TopHomePage);
    expect(topBar, findsOneWidget);
    final buttonWaifu = find.byType(ButtonsNext);
    expect(buttonWaifu, findsNWidgets(2));

  });
}
