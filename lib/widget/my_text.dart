import 'package:adopt_ta_waifu/controller/constant/colors.dart';
import 'package:flutter/material.dart';

class MyText extends SelectableText {
  MyText({
    required String data,
    double fontSize: 16.0,
    Color color: white,
    FontWeight fontWeight: FontWeight.normal,
    FontStyle fontStyle: FontStyle.normal,
    Color colorShadow: transparent,
    double textScaleFactor: 1,
    double height: 1,
    TextAlign alignement: TextAlign.left,
    int maxLines: 1,
  }) : super(
          data,
          textAlign: alignement,
          textScaleFactor: textScaleFactor,
          maxLines: maxLines,
          style: TextStyle(
            color: color,
            fontWeight: fontWeight,
            fontSize: fontSize,
            fontStyle: fontStyle,
            height: height,
            fontFamily: "AnimeAce",
            shadows: [
              Shadow(
                color: colorShadow,
                offset: Offset(1, 1),
                blurRadius: 4.0,
              ),
            ],
          ),
        );
}

class MyCupertinoText extends DefaultTextStyle {
  MyCupertinoText({
    required data,
    color: black,
  }) : super(
          style: TextStyle(
            color: color,
          ),
          child: Text(
            data,
          ),
        );
}
