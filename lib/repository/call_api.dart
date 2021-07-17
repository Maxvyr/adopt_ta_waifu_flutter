import 'dart:convert';

import 'package:adopt_ta_waifu/models/Waifu.dart';
import 'package:adopt_ta_waifu/repository/dummy_waifu_list.dart';
import 'package:http/http.dart' as http;

class CallWaifus {
  final String _urlKonochan =
      "https://adopt-ta-waifu.azurewebsites.net/api/GetKonochan";
  final String _urlYandere =
      "https://adopt-ta-waifu.azurewebsites.net/api/GetYandere";
  final String _urlGelbooru =
      "https://adopt-ta-waifu.azurewebsites.net/api/GetGelbooru";

  Future<List<dynamic>> _requestGet(String url) async {
    Uri uriApi = Uri.parse(url);
    final res = await http.get(uriApi);

    if (res.statusCode == 200) {
      List<dynamic> body = json.decode(res.body);
      print("BODY => $body");
      return body;
    } else if (res.statusCode == 404) {
      print("${res.statusCode}");
      return DummyWaifuList().getWaifus();
    } else {
      return [res.statusCode];
    }
  }

  Future<List<Waifu>> getKonochan() async {
    final List<dynamic> listKonochan = await _requestGet(_urlKonochan);
    final List<Waifu> konochanList = [];
    listKonochan.forEach((element) {
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
    final List<Waifu> waifusKonochan;
    final List<Waifu> waifusYandere;
    final List<Waifu> waifusGelbooru;
    waifusKonochan = await getKonochan();
    waifusYandere = await getYandere();
    waifusGelbooru = await getGelbooru();

    return waifusKonochan + waifusYandere + waifusGelbooru;
  }
}
