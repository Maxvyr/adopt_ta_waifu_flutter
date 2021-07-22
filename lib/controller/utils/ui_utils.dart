import 'package:flutter/material.dart';

bool isInDarkMode(BuildContext context) {
  final Brightness brightnessValue = MediaQuery.of(context).platformBrightness;
  final bool isDarkMode = brightnessValue == Brightness.dark;
  return isDarkMode;
}
