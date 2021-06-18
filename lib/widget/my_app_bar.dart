import 'package:adopt_ta_waifu/widget/my_materials.dart';
import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  MyAppBar({
    required String title,
  }) : super(
          title: MyText(data: title),
          centerTitle: true,
        );
}
