import 'package:adopt_ta_waifu/controller/constant/routes.dart';
import 'package:adopt_ta_waifu/controller/constant/strings.dart';
import 'package:adopt_ta_waifu/controller/utils/connectivity_provider.dart';
import 'package:adopt_ta_waifu/models/waifus.dart';
import 'package:adopt_ta_waifu/views/before_home_page.dart';
import 'package:adopt_ta_waifu/views/coming_soon.dart';
import 'package:adopt_ta_waifu/views/home_page.dart';
import 'package:adopt_ta_waifu/views/show_card_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ConnectivityProvider(),
          child: const BeforeHomePage(),
        ),
      ],
      child: MaterialApp.router(
        routeInformationProvider: _router.routeInformationProvider,
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
        title: strAppName,
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        // home: const BeforeHomePage(), //TODO gestion no network to update
        builder: EasyLoading.init(),
      ),
    );
  }

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.home,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const MyHomePage(),
        ),
      ),
      GoRoute(
        path: Routes.showCard,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: ShowCardPage(state.extra as List<Waifu>),
        ),
      ),
      GoRoute(
        path: Routes.comingSoon,
        builder: (context, state) => const ComingSoon(),
      ),
    ],
  );
}
