import 'package:flutter/cupertino.dart';

class MySingleChildScrollView extends SingleChildScrollView {
  MySingleChildScrollView({required Widget child})
      : super(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: child,
          ),
        );
}
