import 'package:adopt_ta_waifu/controller/constant/Strings.dart';
import 'package:adopt_ta_waifu/controller/utils/navigation.dart';
import 'package:adopt_ta_waifu/repository/DummyWaifuList.dart';
import 'package:adopt_ta_waifu/views/ShowCardPage.dart';

import '../../controller/constant/Colors.dart';
import '../../controller/constant/Images.dart';
import '../../widget/my_materials.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var heightTotal = MediaQuery.of(context).size.height;
    var widthTotal = MediaQuery.of(context).size.width;

    return Scaffold(
      body: _body(
        heightTotal,
        widthTotal,
      ),
    );
  }

  Widget _body(double heightTotal, double widthTotal) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        _topPage(heightTotal, widthTotal),
        spacingH(height: heightTotal * 0.1),
        _buttonsNext(),
      ],
    );
  }

  Widget _topPage(double heightTotal, double widthTotal) {
    double radiusImg = widthTotal * 0.1;
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightnessValue == Brightness.dark;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          children: [
            Image.asset(
              zeroTwoTop,
              height: heightTotal * 0.5,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: radiusImg,
            )
          ],
        ),
        ClipOval(
          child: Container(
            color: isDarkMode ? dark : white,
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(logoApp),
              radius: radiusImg,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buttonsNext() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MyButtonElevated(
          txtBt: strWaifu,
          callback: () => animationPage(
            context,
            ShowCardPage(
              strWaifu,
              DummyWaifuList().getWaifus(),
            ),
          ),
        ),
        MyButtonElevated(
          txtBt: strHusbando,
          callback: () => animationPage(
            context,
            ShowCardPage(
              strHusbando,
              DummyWaifuList().getWaifus(),
            ),
          ),
        ),
      ],
    );
  }
}
