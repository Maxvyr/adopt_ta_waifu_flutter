import 'package:adopt_ta_waifu/models/Waifu.dart';
import 'package:adopt_ta_waifu/widget/my_materials.dart';
import 'package:flutter/material.dart';

class WaifuPage extends StatelessWidget {
  final List<Waifu> waifus;
  WaifuPage(this.waifus);

  @override
  Widget build(BuildContext context) {
    return LoadingPage();
  }
}
