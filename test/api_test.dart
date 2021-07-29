import 'package:adopt_ta_waifu/repository/call_api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  //Call API with OK
  test('callAPI return list ok', () async {
    //variable
    final response = await CallWaifus().getWaifus();
    expect(response.isNotEmpty, true);
  });

  test("callAPI getKonachan", () async {
    //variable
    final response = await CallWaifus().getKonachan();
    expect(response.isNotEmpty, true);
  });

  test("callAPI getYandere", () async {
    //variable
    final response = await CallWaifus().getYandere();
    expect(response.isNotEmpty, true);
  });

  test("callAPI getGelbooru", () async {
    //variable
    final response = await CallWaifus().getGelbooru();
    expect(response.isNotEmpty, true);
    expect(response[0].author, "unknown");
  });
}
