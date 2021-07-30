import 'package:flutter_driver/driver_extension.dart';
import 'package:adopt_ta_waifu/main.dart' as app;

void main() {
  // for launch integration test on device
  enableFlutterDriverExtension();
  // launch my flutter app
  app.main();
}
