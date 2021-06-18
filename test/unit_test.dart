import 'package:adopt_ta_waifu/models/waifu.dart';
import 'package:adopt_ta_waifu/repository/call_api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  //Call API with OK
  test('callAPI return list ok', () async {
    //variable
    List<Waifu> response = await CallApi().getWaifus();
    expect(response.length > 0, true);
  });
}
