import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCupertinoTextField extends CupertinoTextField {
  MyCupertinoTextField({
    required TextEditingController controller,
    TextInputType type: TextInputType.text,
    String hint: "",
    bool isObscure: false,
  }) : super(
          controller: controller,
          keyboardType: type,
          obscureText: isObscure,
          placeholder: hint,
        );
}
