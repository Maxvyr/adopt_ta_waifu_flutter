import 'dart:convert' as cnv;

import 'package:adopt_ta_waifu/models/Waifu.dart';
import 'package:adopt_ta_waifu/repository/dummy_waifu_list.dart';
import 'package:http/http.dart' as http;

class CallWaifus {
  final String _urlYandere = "https://yande.re/post.json";
  final String _urlGelbooru = "https://gelbooru-xsd8bjco8ukx.runkit.sh/posts";

  Future<List<dynamic>> _requestGetFromList(String url) async {
    Uri uriApi = Uri.parse(url);
    print("go");
    print("uri => $uriApi");

    try {
      final http.Response res = await http.get(
        uriApi,
      );
      print(res.statusCode);
      if (res.statusCode == 200) {
        final List<dynamic> body = cnv.jsonDecode(res.body) as List<dynamic>;
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

  Future<List<dynamic>> _requestGetFromMap(String url) async {
    Uri uriApi = Uri.parse(url);
    print("go");
    print("uri => $uriApi");

    try {
      final http.Response res = await http.get(
        uriApi,
      );
      print(res.statusCode);
      if (res.statusCode == 200) {
        final Map<String, dynamic> body = cnv.json.decode(res.body) as Map<String, dynamic>;
        final List<dynamic> list = body["posts"] as List<dynamic>;
        return list;
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

  Future<List<Waifu>> getYandere() async {
    final List<dynamic> listYandere = await _requestGetFromList(_urlYandere);
    final List<Waifu> yandereList = [];
    listYandere.forEach((element) {
      final Waifu waifu = Waifu.fromYandere(element);
      yandereList.add(waifu);
    });

    return yandereList;
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
    final List<Waifu> waifusGelbooru;
    waifusYandere = await getYandere();
    waifusGelbooru = await getGelbooru();

    return waifusYandere + waifusGelbooru;
  }
}
