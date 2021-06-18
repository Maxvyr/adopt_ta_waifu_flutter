import 'package:adopt_ta_waifu/controller/constant/colors.dart';
import 'package:adopt_ta_waifu/controller/constant/icons.dart';
import 'package:adopt_ta_waifu/controller/constant/strings.dart';
import 'package:adopt_ta_waifu/controller/utils/share_img.dart';
import 'package:adopt_ta_waifu/controller/utils/custom_animation.dart';
import 'package:adopt_ta_waifu/models/waifu.dart';
import 'package:adopt_ta_waifu/widget/my_cached_image_network.dart';
import 'package:adopt_ta_waifu/widget/my_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ShowCardPage extends StatefulWidget {
  final String title;
  final List<Waifu> waifus;
  ShowCardPage(this.title, this.waifus);

  @override
  _ShowCardPageState createState() => _ShowCardPageState();
}

class _ShowCardPageState extends State<ShowCardPage> {
  //variable
  int index = 0;

  @override
  void initState() {
    super.initState();
    configLoadingWhenShare();
  }

  @override
  Widget build(BuildContext context) {
    var heightTotal = MediaQuery.of(context).size.height;
    var widthTotal = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: MyAppBar(
        title: widget.title,
      ),
      body: _body(
        heightTotal,
        widthTotal,
      ),
    );
  }

  Widget _body(double heightTotal, double widthTotal) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          imgCard(heightTotal, widthTotal),
          _rowButton(),
        ],
      ),
    );
  }

  Widget imgCard(double heightTotal, double widthTotal) {
    String imgLink = widget.waifus[index].sample;
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.0),
      child: myCacheImageNetwork(
        imgLink,
        widthTotal,
        heightTotal,
      ),
    );
  }

  Widget _rowButton() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        iconButtonCustom(
          isLike: true,
          callback: () => _shareImg(),
        ),
        iconButtonCustom(
          isLike: false,
          callback: () => _nextPage(),
        ),
      ],
    );
  }

  Widget iconButtonCustom(
      {required bool isLike, required VoidCallback callback}) {
    return IconButton(
      onPressed: callback,
      icon: isLike ? Icon(likeIcon) : Icon(dislikeIcon),
      iconSize: 44.0,
      color: blueMain,
    );
  }

  void _shareImg() async {
    Waifu waifuLiked = widget.waifus[index];
    shareImg(waifuLiked);
    animationLoading();
  }

  void _nextPage() {
    if (index < (widget.waifus.length - 1)) {
      ++index;
      setState(() {});
    } else {
      // TODO if all img show!
      index = 0;
    }
  }

  void configLoadingWhenShare() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingGrid
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = white
      ..backgroundColor = green
      ..indicatorColor = lime
      ..textColor = yellow
      ..maskColor = blueMain.withOpacity(0.5)
      ..userInteractions = true
      ..dismissOnTap = true
      ..customAnimation = CustomAnimation();
  }

  void animationLoading() async {
    EasyLoading.show(
      status: strLoading,
      maskType: EasyLoadingMaskType.black,
    );
  }
}
