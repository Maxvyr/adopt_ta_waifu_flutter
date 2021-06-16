import 'package:adopt_ta_waifu/controller/constant/Colors.dart';
import 'package:flutter/material.dart';

import 'my_materials.dart';

class MyGradient extends BoxDecoration {
  static final FractionalOffset begin = FractionalOffset(0.0, 0.0);
  static final FractionalOffset endHor = FractionalOffset(1.0, 0.0);
  static final FractionalOffset endVer = FractionalOffset(0.0, 1.0);

  MyGradient({
    required Color startColor,
    required Color endColor,
    Color borderColor: black,
    bool horizontal: false,
    double topLeftRadius: 25.0,
    double topRightRadius: 25.0,
    double bottomLeftRadius: 25.0,
    double bottomRightRadius: 25.0,
    double widthBorder: 0.5,
  }) : super(
          gradient: LinearGradient(
            colors: [startColor, endColor],
            begin: begin,
            end: horizontal ? endHor : endVer,
            tileMode: TileMode.clamp,
          ),
          border: Border.all(
            color: borderColor,
            width: widthBorder,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeftRadius),
            topRight: Radius.circular(topRightRadius),
            bottomLeft: Radius.circular(bottomLeftRadius),
            bottomRight: Radius.circular(bottomRightRadius),
          ),
        );
}
