import 'package:adopt_ta_waifu/controller/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'my_materials.dart';

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    gradient: myGradient(),
  );
}

LinearGradient myGradient() {
  return LinearGradient(
    colors: [red, accentDark],
    begin: Alignment(0, 1),
    end: Alignment(0.5, 0),
  );
}

void navigationBarBlanc() {
  print("navigationBarBlanc");
  Future.delayed(Duration(milliseconds: 1), () {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
      // status bar color
      systemNavigationBarColor: Colors.white,
      // navigation bar color
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Colors.black26,
      statusBarIconBrightness: Brightness.light,
    ));

    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
  });
}

void navigationBarNoir() {
  print("navigationBarNoir");
  Future.delayed(Duration(milliseconds: 1), () {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));

    SystemChrome.setEnabledSystemUIOverlays([]);
  });
}

void navigationBarTransparent() {
  print("navigationBarTransparent");
  Future.delayed(Duration(milliseconds: 1), () {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent, // status bar color
      systemNavigationBarColor: black, // navigation bar color
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ));
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
  });
}

paddingText(String txt) {
  return Padding(
    padding: EdgeInsets.all(15.0),
    child: MyText(
      data: txt,
      textScaleFactor: 0.8,
      fontWeight: FontWeight.bold,
    ),
  );
}
