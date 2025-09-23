import 'package:flutter/material.dart';

class MyBtn extends StatelessWidget {
  final Color? btnBgColor;
  final Color? textColor;
  final String text;
  final double? radius;
  const MyBtn({
    super.key,
    this.text = "btn Text",
    this.textColor = Colors.black,
    this.btnBgColor = Colors.white,
    this.radius = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: btnBgColor,
        borderRadius: BorderRadius.circular(radius!),
      ),

      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: textColor,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
