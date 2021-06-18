import 'package:adopt_ta_waifu/controller/constant/icons.dart';
import 'package:adopt_ta_waifu/controller/constant/images.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget myCacheImageNetwork(
    String imgUrl, double widthTotal, double heightTotal) {
  return CachedNetworkImage(
    imageUrl: imgUrl,
    width: widthTotal * 0.8,
    height: heightTotal * 0.5,
    placeholder: (context, url) => placeHolderWidget(),
    errorWidget: (context, url, error) => Icon(errorIcon),
    fit: BoxFit.fill,
    fadeInCurve: Curves.fastOutSlowIn,
    fadeOutCurve: Curves.elasticOut,
  );
}

Widget placeHolderWidget() {
  return Stack(
    alignment: Alignment.center,
    children: [
      Image.asset(
        placeHolderImg,
        fit: BoxFit.fill,
      ),
      Container(
        height: 100,
        width: 100,
        child: CircularProgressIndicator(),
      ),
    ],
  );
}
