import 'dart:convert' as cnv;

import 'package:adopt_ta_waifu/models/waifus.dart';
import 'package:adopt_ta_waifu/repository/dummy_waifu_list.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class CallWaifus {
  final String _urlYandere = "https://yande.re/post.json";
  final String _urlKonachan = "https://hello.maxvyr.workers.dev/";

  Future<List<dynamic>> _requestGetFromList(String url) async {
    final Uri uriApi = Uri.parse(url);
    debugPrint("uri for list return => $url");

    try {
      final http.Response res = await http.get(
        uriApi,
      );
      if (res.statusCode == 200) {
        debugPrint("${res.statusCode} from List");
        final List<dynamic> body = cnv.jsonDecode(res.body) as List<dynamic>;
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

  Future<List<Waifu>> getYandere() async {
    final List<dynamic> listYandere = await _requestGetFromList(_urlYandere);
    final List<Waifu> yandereList = [];
    for (final element in listYandere) {
      final Waifu waifu = Waifu.fromYandere(element);
      yandereList.add(waifu);
    }

    return yandereList;
  }

  Future<List<Waifu>> getKonachan() async {
    final List<dynamic> listKonachan = await _requestGetFromList(_urlKonachan);
    final List<Waifu> konachanList = [];
    for (final element in listKonachan) {
      final Waifu waifu = Waifu.fromKonachan(element);
      konachanList.add(waifu);
    }

    return konachanList;
  }

  Future<List<Waifu>> getWaifus() async {
    final List<Waifu> waifusYandere;
    final List<Waifu> waifusKonachan;
    waifusYandere = await getYandere();
    waifusKonachan = await getKonachan();

    return waifusYandere + waifusKonachan;
  }
}
