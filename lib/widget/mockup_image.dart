import 'package:flutter/material.dart';

class MockupImage extends Container {
  MockupImage({
    required AssetImage assetImage,
    super.key,
    double height = 500.0,
  }) : super(
          height: height,
          width: height / 2,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: assetImage,
            ),
          ),
        );
}
