import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButtonTabBar extends BottomNavigationBarItem {
  MyButtonTabBar({
    required String title,
    required IconData iconData,
  }) : super(
          icon: Icon(iconData),
          label: title,
        );
}
