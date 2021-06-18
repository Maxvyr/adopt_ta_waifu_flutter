import 'package:adopt_ta_waifu/controller/constant/Colors.dart';
import 'package:adopt_ta_waifu/controller/constant/Strings.dart';
import 'package:adopt_ta_waifu/widget/my_materials.dart';
import 'package:flutter/material.dart';

class ComingSoon extends StatelessWidget {
  final String title;

  ComingSoon(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: title),
      body: Center(
        child: MyText(
          data: strComingSoon,
          color: black,
          fontSize: 45.0,
        ),
      ),
    );
  }
}
