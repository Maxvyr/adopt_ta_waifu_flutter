import 'dart:convert' as cnv;

import 'package:adopt_ta_waifu/models/waifu.dart';
import 'package:adopt_ta_waifu/repository/dummy_waifu_list.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class CallWaifus {
  final String _urlYandere = "https://yande.re/post.json";
  final String _urlGelbooru = "https://gelbooru-xsd8bjco8ukx.runkit.sh/posts";

  Future<List<dynamic>> _requestGetFromList(String url) async {
    final Uri uriApi = Uri.parse(url);
    debugPrint("uri for list return => $url");

    try {
      final http.Response res = await http.get(
        uriApi,
      );
      print(res.statusCode);
      if (res.statusCode == 200) {
        final List<dynamic> body = cnv.jsonDecode(res.body) as List<dynamic>;
        debugPrint("BODY => $body");
        return body;
      } else if (res.statusCode == 404) {
        debugPrint("${res.statusCode}");
        return DummyWaifuList().getWaifus();
      } else {
        debugPrint("euh => ${res.statusCode}");
        return [res.statusCode];
      }
    } catch (e) {
      debugPrint("error => $e");
      return ["ERROR"];
    }
  }

  Future<List<dynamic>> _requestGetFromMap(String url) async {
    final Uri uriApi = Uri.parse(url);
    debugPrint("uri for map return => $url");

    try {
      final http.Response res = await http.get(
        uriApi,
      );
      print(res.statusCode);
      if (res.statusCode == 200) {
        final Map<String, dynamic> body =
            cnv.json.decode(res.body) as Map<String, dynamic>;
        final List<dynamic> list = body["posts"] as List<dynamic>;
        return list;
      } else if (res.statusCode == 404) {
        debugPrint("${res.statusCode}");
        return DummyWaifuList().getWaifus();
      } else {
        debugPrint("euh => ${res.statusCode}");
        return [res.statusCode];
      }
    } catch (e) {
      debugPrint("error => $e");
      return ["ERROR"];
    }
  }

  Future<List<Waifu>> getYandere() async {
    final List<dynamic> listYandere = await _requestGetFromList(_urlYandere);
    final List<Waifu> yandereList = [];
    listYandere.forEach((element) {
      final Waifu waifu = Waifu.fromYandere(element);
      yandereList.add(waifu);
    });

    return yandereList;
  }

  Future<List<Waifu>> getKonachan() async {
    final List<dynamic> listKonachan = await _requestGetFromList(_urlYandere);
    final List<Waifu> konachanList = [];
    listKonachan.forEach((element) {
      final Waifu waifu = Waifu.fromKonachan(element);
      konachanList.add(waifu);
    });

    return konachanList;
  }

  Future<List<Waifu>> getGelbooru() async {
    final List<dynamic> listGelbooru = await _requestGetFromMap(_urlGelbooru);
    final List<Waifu> gelbooruList = [];
    listGelbooru.forEach((element) {
      final Waifu waifu = Waifu.fromGelbooru(element);
      gelbooruList.add(waifu);
    });
    return gelbooruList;
  }

  Future<List<Waifu>> getWaifus() async {
    final List<Waifu> waifusYandere;
    final List<Waifu> waifusKonachan;
    final List<Waifu> waifusGelbooru;
    waifusYandere = await getYandere();
    waifusKonachan = await getKonachan();
    waifusGelbooru = await getGelbooru();

    return waifusYandere + waifusKonachan + waifusGelbooru;
  }
}
