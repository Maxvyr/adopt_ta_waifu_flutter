import 'dart:convert';

import 'package:adopt_ta_waifu/models/waifu.dart';
import 'package:adopt_ta_waifu/repository/dummy_waifu_list.dart';
import 'package:http/http.dart' as http;

class CallApi {
  String _url = "https://adopt-ta-waifu.herokuapp.com/api";

  Future<Map<String, dynamic>> _requestGet() async {
    // Future<List> _requestGet() async {
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

  Future<List<Waifu>> getWaifus() async {
    final map = await _requestGet();
    List data = map["fields"];
    List<Waifu> waifus = [];
    data.forEach((element) {
      Waifu waifu = Waifu.fromMap(element);
      waifus.add(waifu);
    });
    return waifus;
  }
}
