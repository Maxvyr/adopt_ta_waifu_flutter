import 'package:adopt_ta_waifu/controller/constant/routes.dart';
import 'package:adopt_ta_waifu/controller/constant/strings.dart';
import 'package:adopt_ta_waifu/controller/utils/ui_utils.dart';
import 'package:adopt_ta_waifu/models/waifus.dart';
import 'package:adopt_ta_waifu/repository/call_api.dart';
import 'package:go_router/go_router.dart';

import '../controller/constant/images.dart';
import '../../widget/my_materials.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
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
      builder: (_, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
            return const LoadingPage();
          case ConnectionState.none:
            return const LoadingPage();
          case ConnectionState.waiting:
            return const LoadingPage();
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
            return const LoadingPageError();
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
        const TopHomePage(),
        SizedBox(height: heightTotal * 0.1),
        ButtonsNext(waifus),
      ],
    );
  }
}

class TopHomePage extends StatelessWidget {
  const TopHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final heightTotal = MediaQuery.of(context).size.height;
    const radiusImg = 60.0;
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
            const SizedBox(height: radiusImg)
          ],
        ),
        const ClipOval(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(logoApp),
              radius: radiusImg,
              backgroundColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class ButtonsNext extends StatelessWidget {
  const ButtonsNext(this.waifus, {super.key});
  final List<Waifu> waifus;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FilledButton(
          key: const Key(keyWaifuBt),
          onPressed: () => context.push(Routes.showCard, extra: waifus),
          child: const Text(strWaifu),
        ),
        // OpenContainer(
        //   openColor: Theme.of(context).colorScheme.background,
        //   closedColor: Theme.of(context).colorScheme.background,
        //   transitionDuration: const Duration(seconds: 1),
        //   closedShape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(25),
        //   ),
        //   closedBuilder: (_, openContainer) => FilledButton(
        //     key: const Key(keyWaifuBt),
        //     onPressed: openContainer,
        //     child: const Text(strWaifu),
        //   ),
        //   openBuilder: (_, closeContainer) => ShowCardPage(
        //     strWaifu,
        //     closeContainer,
        //     waifus,
        //   ),
        //   tappable: false,
        // ),
        FilledButton(
          key: const Key(keyHusbandoBt),
          onPressed: () => context.push(Routes.comingSoon),
          child: const Text(strHusbando),
        ),
        // OpenContainer(
        //   openColor: Theme.of(context).colorScheme.background,
        //   closedColor: Theme.of(context).colorScheme.background,
        //   transitionDuration: const Duration(seconds: 1),
        //   closedShape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(25),
        //   ),
        //   closedBuilder: (_, openContainer) {
        //     return FilledButton(
        //       key: const Key(keyHusbandoBt),
        //       onPressed: openContainer,
        //       child: const Text(strHusbando),
        //     );
        //   },
        //   openBuilder: (_, __) => const ComingSoon(strHusbando),
        // ),
      ],
    );
  }
}
