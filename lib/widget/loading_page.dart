import 'package:adopt_ta_waifu/controller/constant/colors.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //variable
    var widthTotal = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: blueMain,
          child: Center(
            child: Container(
              width: widthTotal * 0.3,
              height: widthTotal * 0.3,
              color: blueMain,
              child: CircularProgressIndicator(
                color: white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoadingPageError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //variable
    var widthTotal = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: blueMain,
          child: Center(
            child: Container(
              width: widthTotal * 0.3,
              height: widthTotal * 0.3,
              color: blueMain,
              child: CircularProgressIndicator(
                color: red,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
