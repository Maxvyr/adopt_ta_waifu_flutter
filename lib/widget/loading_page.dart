import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    //variable
    final widthTotal = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: widthTotal * 0.3,
            height: widthTotal * 0.3,
            child: const CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}

class LoadingPageError extends StatelessWidget {
  const LoadingPageError({super.key});

  @override
  Widget build(BuildContext context) {
    //variable
    final widthTotal = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: widthTotal * 0.3,
            height: widthTotal * 0.3,
            child: const CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
