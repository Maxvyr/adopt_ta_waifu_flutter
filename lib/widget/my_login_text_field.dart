import 'package:adopt_ta_waifu/controller/constant/Colors.dart';
import 'package:flutter/material.dart';

import 'my_materials.dart';

// ignore: must_be_immutable
class MyLoginTextField extends StatefulWidget {
  TextEditingController controller;
  TextInputType type;
  String hint;
  String? labelText;
  String? suffixText;
  Icon? icon;
  IconButton? iconTrailing;
  bool obscure;
  FocusNode focus;
  TextInputAction action;
  Function(String)? onFieldSubmitted;
  Function(String)? validator;
  Function(String)? onChanged;
  VoidCallback? onEditingComplete;
  bool enabled = false;

  MyLoginTextField({
    required this.controller,
    required this.hint,
    required this.focus,
    this.type: TextInputType.text,
    this.action: TextInputAction.done,
    this.obscure: false,
    this.icon,
    this.iconTrailing,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.labelText,
    this.validator,
    this.enabled: true,
    this.onChanged,
    this.suffixText,
  });

  @override
  State createState() {
    return MyLoginTextFieldState();
  }
}

class MyLoginTextFieldState extends State<MyLoginTextField> {
  bool hasFocus = false;

  @override
  void initState() {
    super.initState();
    // change value has focus when user click on TextField
    widget.focus.addListener(() {
      if (widget.focus.hasFocus) {
        hasFocus = true;
      } else {
        hasFocus = false;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AnimatedContainer(
            duration: Duration(milliseconds: 150),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(38.0),
                ),
              ),
              color: backgroundDark,
            ),
            child: TextFormField(
              autocorrect: false,
              enabled: widget.enabled,
              controller: widget.controller,
              keyboardType: widget.type,
              obscureText: widget.obscure,
              obscuringCharacter: "*",
              textInputAction: widget.action,
              focusNode: widget.focus,
              style: TextStyle(
                color: tertiaryDark,
                fontWeight: FontWeight.w400,
              ),
              cursorColor: white,
              onFieldSubmitted: widget.onFieldSubmitted,
              onEditingComplete: widget.onEditingComplete,
              onChanged: widget.onChanged,
              decoration: InputDecoration(
                fillColor: level2dark,
                filled: hasFocus,
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                hintText: widget.hint,
                hintStyle: TextStyle(
                  color: hasFocus ? transparent : blueLightTerciaire,
                  fontWeight: FontWeight.w300,
                ),
                labelText: widget.labelText,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 18,
                ),
                icon: widget.icon,
                suffixIcon: widget.iconTrailing,
                border: inputBorderNormal(),
                suffixText: widget.suffixText,
                suffixStyle: TextStyle(
                  color: blueLightTerciaire,
                  fontWeight: FontWeight.w300,
                ),
                enabledBorder: inputBorderNormal(),
                focusedBorder: inputBorderFocused(),
                errorBorder: inputBorderErrorBorder(),
                disabledBorder: inputBorderDisabledBorder(),
                focusedErrorBorder: inputBorderFocusedErrorBorder(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

InputBorder inputBorderNormal() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(38.0),
    ),
    borderSide: BorderSide(
      color: white.withOpacity(0.2),
      width: 1,
    ),
  );
}

InputBorder inputBorderFocused() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(38.0),
    ),
    borderSide: BorderSide(
      color: white.withOpacity(0.2),
      width: 1,
    ),
  );
}

InputBorder inputBorderErrorBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(38.0),
    ),
    borderSide: BorderSide(
      color: red,
      width: 1,
    ),
  );
}

InputBorder inputBorderDisabledBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(38.0),
    ),
    borderSide: BorderSide(
      color: white,
      width: 0.5,
    ),
  );
}

InputBorder inputBorderFocusedErrorBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(38.0),
    ),
    borderSide: BorderSide(
      color: red,
      width: 1,
    ),
  );
}
