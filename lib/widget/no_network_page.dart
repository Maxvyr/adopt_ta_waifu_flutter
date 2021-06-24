import 'package:adopt_ta_waifu/controller/constant/colors.dart';
import 'package:adopt_ta_waifu/controller/constant/strings.dart';
import 'package:adopt_ta_waifu/widget/my_text.dart';
import 'package:flutter/material.dart';

class NoNetworkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //variable
    var widthTotal = MediaQuery.of(context).size.width;
    var heightTotal = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: blueMain,
          child: Center(
            child: Container(
                width: widthTotal * 0.9,
                height: heightTotal * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.network_check_outlined,
                      size: widthTotal * 0.5,
                      color: white,
                    ),
                    MyText(
                      maxLines: 6,
                      data: strNoNetwork,
                      fontSize: 25.0,
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
