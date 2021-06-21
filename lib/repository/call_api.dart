import 'dart:convert';

import 'package:adopt_ta_waifu/models/waifu.dart';
import 'package:adopt_ta_waifu/repository/dummy_waifu_list.dart';
import 'package:http/http.dart' as http;

class CallApi {
  String _url = "https://adopt-ta-waifu.herokuapp.com/api";
  String _urlKonochan = "https://konachan.com/post.json";
  String _urlYandere = "https://yande.re/post.json";

  Future<Map<String, dynamic>> _requestGet() async {
    Uri uriApi = Uri.parse(_url);
    final res = await http.get(uriApi);

    if (res.statusCode == 200) {
      Map<String, dynamic> body = json.decode(res.body);
      print("BODY => $body");
      return body;
    } else if (res.statusCode == 404) {
      // TODO gestion special
      // for now list code hard but after DB
      return {"404": DummyWaifuList().getWaifus()};
    } else {
      return {
        "code": [res.statusCode]
      };
    }
  }

  Future<List<dynamic>> _requestGetList(String url) async {
    Uri uriApi = Uri.parse(url);
    final res = await http.get(uriApi);

    if (res.statusCode == 200) {
      List<dynamic> body = json.decode(res.body);
      print("BODY => $body");
      return body;
    } else if (res.statusCode == 404) {
      // TODO gestion special
      // for now list code hard but after DB
      return [
        {
          "404": DummyWaifuList().getWaifus()
        }
      ];
    } else {
      return [
        {
          "code": [res.statusCode]
        }
      ];
    }
  }

  Future<List<Waifu>> getWaifus() async {
    final listKonochan = await _requestGetList(_urlKonochan);
    List<Waifu> waifusKonochan = [];
    listKonochan.forEach((element) {
      Waifu waifu = Waifu.fromMap(element);
      waifusKonochan.add(waifu);
      print("waifus konochan => ${waifusKonochan.length}");
    });

    final listYandere = await _requestGetList(_urlYandere);
    List<Waifu> waifusYandere = [];
    listYandere.forEach((element) {
      Waifu waifu = Waifu.fromMap(element);
      waifusYandere.add(waifu);
      print("waifus yandere => ${waifusYandere.length}");
    });

    return waifusKonochan + waifusYandere;
  }
}
