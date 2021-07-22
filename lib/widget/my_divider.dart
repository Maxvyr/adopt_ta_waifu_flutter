import 'package:adopt_ta_waifu/controller/constant/colors.dart';
import 'package:flutter/material.dart';

Widget myDividerLight() {
  return const Divider(
    color: colorHint,
  );
}

Widget myDividerDark() {
  return const Divider(
    height: 2,
    thickness: 2,
    color: backgroundDark,
  );
}

Widget myDividerRed() {
  return const Divider(
    color: red,
  );
}
