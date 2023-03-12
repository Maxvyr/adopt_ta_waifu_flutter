import 'package:adopt_ta_waifu/controller/utils/connectivity_provider.dart';
import 'package:adopt_ta_waifu/views/home_page.dart';
import 'package:adopt_ta_waifu/widget/my_materials.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BeforeHomePage extends StatefulWidget {
  const BeforeHomePage({super.key});

  @override
  State<BeforeHomePage> createState() => _BeforeHomePageState();
}

class _BeforeHomePageState extends State<BeforeHomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ConnectivityProvider>(context, listen: false).startMonitoring();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ConnectivityProvider>(builder: (context, model, child) {
      return model.isOnline ? const MyHomePage() : const NoNetworkPage();
    });
  }
}
