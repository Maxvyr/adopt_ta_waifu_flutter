import 'package:adopt_ta_waifu/controller/constant/Colors.dart';
import 'package:flutter/cupertino.dart';


class MyCupertinoSwitch extends CupertinoSwitch {
  MyCupertinoSwitch({
    required bool value,
    required void Function(bool) callback,
  }) : super(
          value: value,
          onChanged: callback,
          activeColor: red,
          trackColor: colorHint,
        );
}
