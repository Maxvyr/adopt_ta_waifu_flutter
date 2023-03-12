import 'package:adopt_ta_waifu/controller/constant/strings.dart';
import 'package:flutter/material.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          strComingSoon,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
