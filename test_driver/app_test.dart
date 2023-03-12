import 'package:adopt_ta_waifu/controller/constant/strings.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  // variable

  // flutter driver
  late FlutterDriver flutterDriver;

  // before
  setUpAll(() async {
    flutterDriver = await FlutterDriver.connect();
    await flutterDriver.waitUntilFirstFrameRasterized();
  });

  // after
  tearDownAll(() async {
    await flutterDriver.close();
  });

  //test Integration
  test("Push button Husbando then show page", () async {
    Future.delayed(const Duration(seconds: 3), () async {
      final btHusbando = find.byValueKey(keyHusbandoBt);

      await flutterDriver.tap(btHusbando);

      final textNewPage = find.text(strHusbando);

      expect(flutterDriver.getText(textNewPage), strHusbando);
    });
  });

  test("Push button Waifu then show page", () async {
    Future.delayed(const Duration(seconds: 3), () async {
      final btWaifu = find.byValueKey(keyWaifuBt);

      await flutterDriver.tap(btWaifu);

      final textNewPage = find.text(strWaifu);
      expect(flutterDriver.getText(textNewPage), strWaifu);
    });
  });
}
