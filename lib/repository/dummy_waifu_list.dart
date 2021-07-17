import 'dart:core';

import 'package:adopt_ta_waifu/models/Waifu.dart';

class DummyWaifuList {
  List<Waifu> _dummyWaifus = [
    Waifu(
        author: "BattlequeenYume",
        file:
            "https://konachan.com/image/1617e40bb2c7bee5c2b3a51f95c10ad5/Konachan.com%20-%20328830%20clouds%20hikari_%28xenoblade%29%20landscape%20night%20roi_%28liu_tian%29%20scenic%20sky%20stars%20xenoblade.jpg",
        previewImg:
            "https://konachan.com/data/preview/16/17/1617e40bb2c7bee5c2b3a51f95c10ad5.jpg",
        sample:
            "https://konachan.com/sample/1617e40bb2c7bee5c2b3a51f95c10ad5/Konachan.com%20-%20328830%20sample.jpg",
        source: "https://www.pixiv.net/en/artworks/91065294"),
  ];

  List<Waifu> getWaifus() {
    return _dummyWaifus;
  }
}
