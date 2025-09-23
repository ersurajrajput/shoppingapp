import 'package:flutter/material.dart';

class Appwidget {
  static TextStyle boldTextFieldStyle() {
    return TextStyle(
      color: Colors.black,
      fontSize: 30.0,

      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle lightTextFieldStyle() {
    return TextStyle(
      color: Colors.black54,
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle textFieldStyle1({final Color? textColor = Colors.black}) {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: textColor,
    );
  }
}
