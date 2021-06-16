import 'package:flutter/material.dart';

void popPage(BuildContext context, {bool result: false}) {
  Navigator.pop(context, result);
}

void goToNextPage(BuildContext context, Widget nextPage) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => nextPage,
      ));
}

void animationPageFromRight(BuildContext context, Widget nextPage,
    {int animationDuration: 200}) {
  Navigator.push(
    context,
    animationOrientation(true, nextPage, animationDuration),
  );
}

void animationPageFromBottom(BuildContext context, Widget nextPage,
    {int animationDuration: 200}) {
  Navigator.push(
    context,
    animationOrientation(false, nextPage, animationDuration),
  );
}

Route animationOrientation(bool fromRight, Widget child, animationDuration) {
  return PageRouteBuilder(
    transitionDuration: Duration(milliseconds: animationDuration),
    transitionsBuilder: (context, animation, animationTime, child) {
      var begin = fromRight ? Offset(1.0, 0.0) : Offset(0.0, 1.0);
      var end = Offset.zero;
      var tween = Tween(begin: begin, end: end);
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
    pageBuilder: (context, animation, animationTime) {
      return child;
    },
  );
}

void goToNextPageWeb(BuildContext context, dynamic page) {
  Navigator.of(context).pushReplacementNamed(page);
}
