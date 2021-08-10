import 'package:adopt_ta_waifu/controller/constant/colors.dart';
import 'package:adopt_ta_waifu/controller/constant/strings.dart';
import 'package:adopt_ta_waifu/widget/my_materials.dart';
import 'package:flutter/material.dart';

class ComingSoon extends StatelessWidget {
  final String title;
  final Function({Never returnValue}) backAppBar;

  ComingSoon(this.title, this.backAppBar);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: title,
        context: context,
        onPressed: backAppBar,
      ),
      body: Center(
        child: MyText(
          data: strComingSoon,
          color: black,
          fontSize: 35.0,
        ),
      ),
    );
  }
}
