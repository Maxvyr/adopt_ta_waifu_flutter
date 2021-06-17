import 'package:adopt_ta_waifu/controller/constant/Colors.dart';
import 'package:adopt_ta_waifu/controller/constant/Icons.dart';
import 'package:adopt_ta_waifu/controller/constant/Images.dart';
import 'package:adopt_ta_waifu/controller/constant/Strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'my_materials.dart';

openGooglePlay() async {
  String url = "";
  await canLaunch(url) ? await launch(url) : print("Impossible d'ouvrir l'url");
}

openAppStore() async {
  String url = "";
  await canLaunch(url) ? await launch(url) : print("Impossible d'ouvrir l'url");
}

class ButtonSocialNetwork extends Padding {
  ButtonSocialNetwork({
    required bool isAndroid,
    required double width,
    double padding: 8.0,
  }) : super(
          padding: EdgeInsets.all(padding),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0.0,
              primary: accent2,
              onPrimary: blueMain,
              shadowColor: Color(0xff101735),
            ),
            onPressed: () => isAndroid ? openGooglePlay() : openAppStore(),
            child: Container(
              width: width >= 1000 ? width * 0.2 : 180,
              height: 90,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    isAndroid ? googlePlayPNG : appStorePNG,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyText(
                        data: strDwldOn,
                        fontWeight: FontWeight.w400,
                      ),
                      MyText(
                        data: isAndroid ? strGooglePlay : strAppStore,
                        fontWeight: FontWeight.w700,
                        fontSize: width >= 1000 ? 33 : 25,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
}

class MyButtonElevated extends SizedBox {
  MyButtonElevated({
    double heightBt: 46,
    double widthBt: 150,
    required String txtBt,
    required VoidCallback callback,
    Color txtColor: white,
    Color backgroundColor: blueMain,
    FontWeight fontWeight: FontWeight.w700,
    bool addIcon: false,
  }) : super(
          height: heightBt,
          width: widthBt,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(22),
                ),
              ),
            ),
            onPressed: callback,
            child: Row(
              mainAxisAlignment: addIcon
                  ? MainAxisAlignment.spaceEvenly
                  : MainAxisAlignment.center,
              children: [
                MyText(
                  data: txtBt,
                  fontWeight: fontWeight,
                  color: txtColor,
                ),
                addIcon ? Icon(arrowNextIcon) : SizedBox()
              ],
            ),
          ),
        );
}

class MyButtonFlat extends SizedBox {
  MyButtonFlat(
      {double heightBt: 46,
      double widthBt: 216,
      required String txtBt,
      required VoidCallback callback,
      Color color: red,
      FontWeight fontWeight: FontWeight.w700,
      double fontSize: 18.0})
      : super(
          height: heightBt,
          width: widthBt,
          child: TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(22),
                ),
              ),
            ),
            onPressed: callback,
            child: MyText(
              data: txtBt,
              color: color,
              fontWeight: fontWeight,
              fontSize: fontSize,
            ),
          ),
        );
}

class MyButtonFlatWithBorder extends SizedBox {
  MyButtonFlatWithBorder({
    double heightBt: 46,
    double widthBt: 216,
    required String txtBt,
    required VoidCallback callback,
    Color color: white,
    FontWeight fontWeight: FontWeight.w700,
  }) : super(
          height: heightBt,
          width: widthBt,
          child: TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: color,
                  width: 2,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(22),
                ),
              ),
            ),
            onPressed: callback,
            child: MyText(
              data: txtBt,
              color: color,
              fontWeight: fontWeight,
            ),
          ),
        );
}

class MyCupertinoButton extends CupertinoButton {
  MyCupertinoButton({
    required String text,
    required VoidCallback callback,
    Color colorButton: blueMain,
    Color colorText: white,
    double txtSize: 18.0,
    double minSize: 44.0,
    FontStyle fontStyle: FontStyle.normal,
  }) : super(
          color: colorButton,
          onPressed: callback,
          minSize: minSize,
          child: MyText(
            data: text,
            color: colorText,
            fontSize: txtSize,
            fontStyle: fontStyle,
          ),
        );

  MyCupertinoButton.icon({
    required String text,
    required VoidCallback callback,
    required IconData iconData,
    Color colorButton: blueMain,
    Color colorText: white,
    double txtSize: 18.0,
    double minSize: 44.0,
    FontStyle fontStyle: FontStyle.normal,
  }) : super(
          color: colorButton,
          onPressed: callback,
          minSize: minSize,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(iconData),
              spacingW(),
              MyText(
                data: text,
                color: colorText,
                fontSize: txtSize,
                fontStyle: fontStyle,
              ),
            ],
          ),
        );
}

Widget btAnswer({
  required String text,
  required VoidCallback callback,
  txtSize: 20.0,
}) {
  return Container(
    width: 190,
    child: MyCupertinoButton(
      text: text,
      callback: callback,
      minSize: 100.0,
      txtSize: txtSize,
    ),
  );
}
