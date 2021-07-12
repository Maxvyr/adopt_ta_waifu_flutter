import 'dart:convert';

import 'package:adopt_ta_waifu/models/waifu.dart';
import 'package:adopt_ta_waifu/repository/dummy_waifu_list.dart';
import 'package:http/http.dart' as http;

class CallWaifus {
  final String _urlKonochan = "https://konachan.com/post.json";
  final String _urlYandere = "https://yande.re/post.json";
  final String _urlGelbooru = "https://gelbooru-xsd8bjco8ukx.runkit.sh/posts";

  Future<List<dynamic>> _requestGetListFromJsonList(String url) async {
    final Uri uriApi = Uri.parse(url);
    final res = await http.get(uriApi);

    if (res.statusCode == 200) {
      final List<dynamic> body = json.decode(res.body) as List<dynamic>;
      print("BODY => $body");
      return body;
    } else if (res.statusCode == 404) {
      // TODO gestion special
      // for now list code hard but after DB
      return [
        {"404": DummyWaifuList().getWaifus()}
      ];
    } else {
      return [
        {
          "code": [res.statusCode]
        }
      ];
    }
  }

  Future<Map<String, dynamic>> _requestGetListFromJsonMap(String url) async {
    final Uri uriApi = Uri.parse(url);
    final res = await http.get(uriApi);

    if (res.statusCode == 200) {
      final Map<String, dynamic> body =
          jsonDecode(res.body) as Map<String, dynamic>;
      print("BODY => $body");
      return body;
    } else if (res.statusCode == 404) {
      return {
        "404": DummyWaifuList().getWaifus(),
      };
    } else {
      return {
        "code": [res.statusCode],
      };
    }
  }

  Future<List<Map<String, dynamic>>> getKonochan() async {
    final List<dynamic> listKonochan =
        await _requestGetListFromJsonList(_urlKonochan);
    final List<Map<String, dynamic>> konochanList = [];
    listKonochan.forEach((element) {
      final Waifu waifu = Waifu.fromKonochan(element);
      final Map<String, dynamic> map = waifu.toJson();
      konochanList.add(map);
    });

    return konochanList;
  }

  Future<List<Map<String, dynamic>>> getYandere() async {
    final List<dynamic> listYandere =
        await _requestGetListFromJsonList(_urlYandere);
    final List<Map<String, dynamic>> yandereList = [];
    listYandere.forEach((element) {
      final Waifu waifu = Waifu.fromKonochan(element);
      final Map<String, dynamic> map = waifu.toJson();
      yandereList.add(map);
    });

    return yandereList;
  }

  Future<List<Map<String, dynamic>>> getGelbooru() async {
    final Map<String, dynamic> mapGelbooru =
        await _requestGetListFromJsonMap(_urlGelbooru);
    final List<Map<String, dynamic>> gelbooruList = [];
    final listGelbooru = mapGelbooru["posts"];
    listGelbooru.forEach((element) {
      final Waifu waifu = Waifu.fromGelbooru(element);
      final Map<String, dynamic> map = waifu.toJson();
      gelbooruList.add(map);
    });

    return gelbooruList;
  }

  Future<Map<String, dynamic>> getWaifus() async {
    final List<Map<String, dynamic>> waifusKonochan;
    final List<Map<String, dynamic>> waifusYandere;
    final List<Map<String, dynamic>> waifusGelbooru;
    waifusKonochan = await getKonochan();
    waifusYandere = await getYandere();
    waifusGelbooru = await getGelbooru();

    final Map<String, dynamic> mapWaifu = {
      "fields": [
        waifusKonochan,
        waifusYandere,
        waifusGelbooru,
      ],
    };

    return mapWaifu;
  }
}
