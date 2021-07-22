import 'package:adopt_ta_waifu/controller/constant/colors.dart';
import 'package:adopt_ta_waifu/controller/constant/strings.dart';
import 'package:adopt_ta_waifu/controller/utils/navigation.dart';
import 'package:adopt_ta_waifu/controller/utils/ui_utils.dart';
import 'package:adopt_ta_waifu/models/Waifu.dart';
import 'package:adopt_ta_waifu/repository/call_api.dart';
import 'package:adopt_ta_waifu/views/show_card_page.dart';
import 'package:adopt_ta_waifu/views/coming_soon.dart';

import '../controller/constant/colors.dart';
import '../controller/constant/images.dart';
import '../../widget/my_materials.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Waifu>> _waifus;
  late bool isDarkMode;

  @override
  void initState() {
    super.initState();
    _waifus = _initList();
  }

  Future<List<Waifu>> _initList() async {
    List<Waifu> list = await CallWaifus().getWaifus();
    return list;
  }

  @override
  Widget build(BuildContext context) {
    var heightTotal = MediaQuery.of(context).size.height;
    var widthTotal = MediaQuery.of(context).size.width;
    isDarkMode = isInDarkMode(context);

    return FutureBuilder(
      future: _waifus,
      builder: (BuildContext context, AsyncSnapshot<List<Waifu>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
            return LoadingPage();
          case ConnectionState.none:
            return LoadingPage();
          case ConnectionState.waiting:
            return LoadingPage();
          case ConnectionState.done:
            List<Waifu> waifus = [];
            if (snapshot.data == null) {
              print("et merde");
            } else {
              waifus = snapshot.data!;
            }

            return Scaffold(
              body: _body(
                heightTotal,
                widthTotal,
                waifus,
              ),
            );
          default:
            return LoadingPageError();
        }
      },
    );
  }

  Widget _body(
    double heightTotal,
    double widthTotal,
    List<Waifu> waifus,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        TopHomePage(),
        spacingH(height: heightTotal * 0.1),
        ButtonsNext(waifus),
      ],
    );
  }

}

class TopHomePage extends StatelessWidget {
  late final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    var heightTotal = MediaQuery.of(context).size.height;
    double radiusImg = MediaQuery.of(context).size.width * 0.1;
    isDarkMode = isInDarkMode(context);
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
}


class ButtonsNext extends StatelessWidget {
  final List<Waifu> waifus;
  late final bool isDarkMode;

  // ignore: prefer_const_constructors_in_immutables
  ButtonsNext(this.waifus);

  @override
  Widget build(BuildContext context) {
    isDarkMode = isInDarkMode(context);
    final Color txtColor = isDarkMode ? blueMain : white;
    final Color backgroundColor = isDarkMode ? white : blueMain;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MyButtonElevated(
          txtBt: strWaifu,
          txtColor: txtColor,
          backgroundColor: backgroundColor,
          callback: () => animationPage(
            context,
            ShowCardPage(
              strWaifu,
              waifus,
            ),
          ),
        ),
        MyButtonElevated(
          txtBt: strHusbando,
          txtColor: txtColor,
          backgroundColor: backgroundColor,
          callback: () => animationPage(
            context,
            ComingSoon(strHusbando),
          ),
        ),
      ],
    );
  }
}