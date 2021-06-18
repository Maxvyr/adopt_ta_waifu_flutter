import 'package:adopt_ta_waifu/controller/constant/colors.dart';
import 'package:flutter/material.dart';


class MyText extends Text {
  MyText({
    required String data,
    double fontSize: 18.0,
    Color color: white,
    FontWeight fontWeight: FontWeight.normal,
    FontStyle fontStyle: FontStyle.normal,
    Color colorShadow: transparent,
    TextOverflow overflow: TextOverflow.ellipsis,
    double textScaleFactor: 1,
    double height: 1,
    TextAlign alignement: TextAlign.left,
    int maxLines: 1,
  }) : super(
          data,
          textAlign: alignement,
          overflow: overflow,
          textScaleFactor: textScaleFactor,
          maxLines: maxLines,
          style: TextStyle(
            color: color,
            fontWeight: fontWeight,
            fontSize: fontSize,
            fontStyle: fontStyle,
            height: height,
            fontFamily: "DIN2014",
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
