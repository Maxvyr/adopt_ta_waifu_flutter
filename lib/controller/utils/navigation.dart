import 'package:flutter/material.dart';

void popPage(BuildContext context, {bool result = false}) {
  Navigator.pop(context, result);
}

void goToNextPage(BuildContext context, Widget nextPage) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => nextPage,
      ));
}

void animationPage(
  BuildContext context,
  Widget nextPage, {
  int animationDuration = 500,
}) {
  Navigator.push(
    context,
    animationOrientation(nextPage, animationDuration),
  );
}

Route animationOrientation(Widget child, int animationDuration) {
  return PageRouteBuilder(
    transitionDuration: Duration(milliseconds: animationDuration),
    transitionsBuilder: (context, animation, animationTime, child) {
      animation = CurvedAnimation(
        parent: animation,
        curve: Curves.decelerate,
      );

      return ScaleTransition(
        scale: animation,
        child: child,
      );
    },
    pageBuilder: (context, animation, animationTime) {
      return child;
    },
  );
}

void goToNextPageWeb(BuildContext context, String page) {
  Navigator.of(context).pushReplacementNamed(page);
}
