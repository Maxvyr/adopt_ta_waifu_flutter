import 'package:adopt_ta_waifu/controller/constant/colors.dart';
import 'package:adopt_ta_waifu/controller/constant/icons.dart';
import 'package:adopt_ta_waifu/controller/utils/navigation.dart';
import 'package:adopt_ta_waifu/widget/my_materials.dart';
import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  MyAppBar({
    required String title,
    required BuildContext context,
    bool isDarkMode = false,
    Function()? onPressed,
  }) : super(
          title: MyText(
            data: title,
            color: isDarkMode ? blueMain : white,
          ),
          centerTitle: true,
          backgroundColor: isDarkMode ? white : blueMain,
          leading: IconButton(
            color: isDarkMode ? blueMain : white,
            icon: const Icon(
              arrowBackAndroidIcon,
              size: 30.0,
            ),
            onPressed: onPressed ?? () => popPage(context),
          ),
        );
}
