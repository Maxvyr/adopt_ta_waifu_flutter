import 'package:adopt_ta_waifu/controller/constant/strings.dart';
import 'package:flutter/material.dart';

class NoNetworkPage extends StatelessWidget {
  const NoNetworkPage({super.key});

  @override
  Widget build(BuildContext context) {
    //variable
    final widthTotal = MediaQuery.of(context).size.width;
    final heightTotal = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
              width: widthTotal * 0.9,
              height: heightTotal * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.network_check_outlined,
                    size: widthTotal * 0.5,
                  ),
                  Text(
                    strNoNetwork,
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ],
              )),
        ),
      ),
    );
  }
}
