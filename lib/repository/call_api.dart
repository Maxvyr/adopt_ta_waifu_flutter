import 'dart:convert' as cnv;

import 'package:adopt_ta_waifu/models/Waifu.dart';
import 'package:adopt_ta_waifu/repository/dummy_waifu_list.dart';
import 'package:http/http.dart' as http;

class CallWaifus {
  final String _urlKonachan =
      "https://adopt-ta-waifu.azurewebsites.net/api/GetKonochan";
  // final String _urlKonachan = "https://konachan.com/post.json";
  // final String _urlYandere =
  //     "https://adopt-ta-waifu.azurewebsites.net/api/GetYandere";
  final String _urlYandere = "https://yande.re/post.json";
  final String _urlGelbooru =
      "https://adopt-ta-waifu.azurewebsites.net/api/GetGelbooru";

  Future<List<dynamic>> _requestGet(String url) async {
    Uri uriApi = Uri.parse(url);
    // Uri uriApi = Uri.parse("https://pokeapi.co/api/v2/pokemon/ditto");
    // Uri uriApi = Uri.https("konachan.com", "/post.json");
    print("go");
    print("uri => $uriApi");

    try {
      final http.Response res = await http.get(
        uriApi,
      );
      print(res.statusCode);
      if (res.statusCode == 200) {
        List<dynamic> body = cnv.jsonDecode(res.body);
        print("BODY => $body");
        return body;
      } else if (res.statusCode == 404) {
        print("${res.statusCode}");
        return DummyWaifuList().getWaifus();
      } else {
        print("euh => ${res.statusCode}");
        return [res.statusCode];
      }
    } catch (e) {
      print("error => $e");
      return ["ERROR"];
    }
  }

  Future<List<Waifu>> getKonachan() async {
    final List<dynamic> listKonachan = await _requestGet(_urlKonachan);
    final List<Waifu> konochanList = [];
    listKonachan.forEach((element) {
      final Waifu waifu = Waifu.fromKonochan(element);
      konochanList.add(waifu);
    });

    return konochanList;
  }

  Future<List<Waifu>> getYandere() async {
    final List<dynamic> listYandere = await _requestGet(_urlYandere);
    final List<Waifu> yandereList = [];
    listYandere.forEach((element) {
      final Waifu waifu = Waifu.fromKonochan(element);
      yandereList.add(waifu);
    });

    return yandereList;
  }

  Future<List<Waifu>> getGelbooru() async {
    //FIXME
    final List<Waifu> gelbooruList = [];
    return gelbooruList;
  }

  Future<List<Waifu>> getWaifus() async {
    // final List<Waifu> waifusKonachan;
    final List<Waifu> waifusYandere;
    // final List<Waifu> waifusGelbooru;
    // waifusKonachan = await getKonachan();
    waifusYandere = await getYandere();
    // waifusGelbooru = await getGelbooru();

    return waifusYandere;
    // return waifusKonochan + waifusYandere + waifusGelbooru;
  }
}
