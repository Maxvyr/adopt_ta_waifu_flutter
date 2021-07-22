import 'dart:io';

import 'package:adopt_ta_waifu/controller/constant/colors.dart';
import 'package:adopt_ta_waifu/controller/constant/strings.dart';
import 'package:adopt_ta_waifu/controller/utils/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'my_materials.dart';

Future alertGeneric({
  required BuildContext context,
  required String title,
  required String textButton,
  Widget? content,
}) async {
  MyText titleField = MyText(
    data: title,
    color: red,
    fontSize: 24,
    maxLines: 3,
  );

  return showDialog(
      context: context,
      barrierColor: accentDark.withOpacity(0.5),
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: primaryLight,
          title: titleField,
          content: content,
          actions: <Widget>[
            TextButton(
              onPressed: () {
                popPage(context);
              },
              child: MyText(
                data: textButton,
                color: red,
              ),
            ),
          ],
        );
      });
}

Future<void> alerte(
  BuildContext context, {
  required String title,
  required String desc,
  bool dismissible = true,
  VoidCallback? callback,
  int lineTitle: 1,
  int lineDesc: 1,
}) async {
  return showDialog(
      context: context,
      barrierDismissible: dismissible,
      builder: (ctx) {
        Widget tTitle = Center(
          child: MyText(
            data: title,
            maxLines: lineTitle,
          ),
        );
        Widget tDesc = MyPadding(
          top: 10.0,
          left: 0.0,
          right: 0.0,
          child: MyText(
            data: desc,
            maxLines: lineDesc,
          ),
        );

        List<Widget> actions = [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              callback!();
            },
            child: MyText(
              data: strOK.toUpperCase(),
            ),
          )
        ];

        return Platform.isIOS
            ? CupertinoAlertDialog(
                title: tTitle,
                content: tDesc,
                actions: actions,
              )
            : AlertDialog(
                backgroundColor: primaryLight,
                title: tTitle,
                content: tDesc,
                actions: actions,
              );
      });
}

Future<void> alertChangeUserData(
  BuildContext context, {
  required String title,
  required String hint,
  required TextEditingController textEditingController,
  required VoidCallback voidCallback,
}) async {
  double paddingVertical = 8.0;
  MyText titleField = MyText(
    data: title,
    fontWeight: FontWeight.w800,
    fontSize: 24.0,
  );

  TextField textField = TextField(
    controller: textEditingController,
    decoration: InputDecoration(
      labelText: hint,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 18,
      ),
      labelStyle: TextStyle(
        color: blueLightTerciaire,
        fontWeight: FontWeight.w300,
      ),
      border: inputBorderNormal(),
      focusedBorder: inputBorderFocused(),
    ),
    cursorColor: white,
  );

  return showDialog(
    context: context,
    barrierColor: accentDark.withOpacity(0.5),
    builder: (BuildContext ctx) {
      return AlertDialog(
        backgroundColor: primaryLight,
        title: titleField,
        content: Padding(
          padding: EdgeInsets.symmetric(vertical: paddingVertical),
          child: textField,
        ),
        actions: [
          _btn(
            context: ctx,
            txt: strValidate,
            callback: voidCallback,
          ),
        ],
      );
    },
  );
}

Widget _btn({
  required BuildContext context,
  required String txt,
  required VoidCallback callback,
}) {
  return TextButton(
    onPressed: callback,
    child: MyText(
      data: txt,
    ),
  );
}

Widget _close({
  required BuildContext context,
  required String txt,
}) {
  return TextButton(
    onPressed: () => Navigator.pop(context),
    child: MyText(
      data: txt,
    ),
  );
}
