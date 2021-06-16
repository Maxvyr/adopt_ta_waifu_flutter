import 'package:flutter/material.dart';

import 'my_materials.dart';

class Menu2Items extends StatelessWidget {
  final String item1;
  final String item2;
  final PageController pageController;

  Menu2Items({
    required this.item1,
    required this.item2,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.0,
      height: 50.0,
      child: CustomPaint(
        painter: MyPainter(pageController),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            itemButton(item1),
            itemButton(item2),
          ],
        ),
      ),
    );
  }

  Widget itemButton(String name) {
    return Expanded(
      child: TextButton(
        onPressed: () => changePage(),
        child: MyText(
          data: name,
          fontWeight: FontWeight.w700,
          fontSize: 25.0,
        ),
      ),
    );
  }

  changePage() {
    int page = (pageController.page == 0.0) ? 1 : 0;
    pageController.animateToPage(
      page,
      duration: Duration(microseconds: 500),
      curve: Curves.decelerate,
    );
  }
}
