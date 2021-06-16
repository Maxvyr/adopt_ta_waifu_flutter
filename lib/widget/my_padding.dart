import 'package:flutter/material.dart';

class MyPadding extends Padding {
  MyPadding({
    required Widget child,
    double left = 30.0,
    double right = 30.0,
    double top = 0.0,
    double bottom = 0.0,
  }) : super(
          padding: EdgeInsets.only(
            left: left,
            right: right,
            top: top,
            bottom: bottom,
          ),
          child: child,
        );
}
