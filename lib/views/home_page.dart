import 'package:adopt_ta_waifu/controller/constant/colors.dart';
import 'package:adopt_ta_waifu/controller/constant/strings.dart';
import 'package:adopt_ta_waifu/controller/utils/ui_utils.dart';
import 'package:adopt_ta_waifu/models/waifus.dart';
import 'package:adopt_ta_waifu/repository/call_api.dart';
import 'package:adopt_ta_waifu/views/show_card_page.dart';
import 'package:adopt_ta_waifu/views/coming_soon.dart';
import 'package:animations/animations.dart';
import 'package:flutter/foundation.dart';

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
    final List<Waifu> list = await CallWaifus().getWaifus();
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final double heightTotal = MediaQuery.of(context).size.height;
    final double widthTotal = MediaQuery.of(context).size.width;
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
    final heightTotal = MediaQuery.of(context).size.height;
    const radiusImg = 80.0;
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
            const SizedBox(
              height: radiusImg,
            )
          ],
        ),
        ClipOval(
          child: Container(
            color: isDarkMode ? dark : white,
            padding: const EdgeInsets.all(5.0),
            child: const CircleAvatar(
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
        OpenContainer(
          transitionDuration: const Duration(seconds: 1),
          openColor: Colors.white,
          closedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          closedColor: Colors.white,
          closedBuilder: (_, openContainer) {
            return MyButtonElevated(
              txtBt: strWaifu,
              txtColor: txtColor,
              key: const Key(keyWaifuBt),
              backgroundColor: backgroundColor,
              callback: openContainer,
              heightBt: kIsWeb ? 100 : 46,
            );
          },
          openBuilder: (_, closeContainer) {
            return ShowCardPage(
              strWaifu,
              closeContainer,
              waifus,
            );
          },
        ),
        OpenContainer(
          transitionDuration: const Duration(seconds: 1),
          openColor: Colors.white,
          closedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          closedColor: Colors.white,
          closedBuilder: (_, openContainer) {
            return MyButtonElevated(
              txtBt: strHusbando,
              txtColor: txtColor,
              key: const Key(keyHusbandoBt),
              backgroundColor: backgroundColor,
              callback: openContainer,
              heightBt: kIsWeb ? 100 : 46,
            );
          },
          openBuilder: (_, closeContainer) {
            return ComingSoon(strHusbando, closeContainer);
          },
        ),
      ],
    );
  }
}
