import 'dart:convert';

import 'package:adopt_ta_waifu/models/Waifu.dart';
import 'package:adopt_ta_waifu/repository/DummyWaifuList.dart';
import 'package:http/http.dart' as http;

class CallApi {
  String url = "https://adopt-ta-waifu.herokuapp.com/api";

  Future<List> _requestGet(String url) async {
    Uri uriApi = Uri.parse(url);
    final res = await http.get(uriApi);

    if (res.statusCode == 200) {
      final body = json.decode(res.body);
      return body;
    } else if (res.statusCode == 404) {
      // TODO gestion special
      // for now list code hard but after DB
      return DummyWaifuList().getWaifus();
    } else {
      return [res.statusCode];
    }
  }

  Future<List<Waifu>> getWaifus(String url) async {
    final list = await _requestGet(url);
    final mapWaifu = list.map((json) => Waifu.fromMap(json));
    return mapWaifu.toList();
  }
}
