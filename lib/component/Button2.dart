import 'package:flutter/material.dart';

class MyBtn2 extends StatelessWidget {
  final Color? btnBgColor;
  final Color? textColor;
  final String text;
  final double? radius;
  final double? width;
  final double? ml;
  final double? mr;
  final double? mt;
  final double? mb;

  const MyBtn2({
    super.key,
    this.text = "btn Text",
    this.textColor = Colors.black,
    this.btnBgColor = Colors.white,
    this.radius = 8.0,
    this.width = 100.0,
    this.ml = 0.0,
    this.mr = 0.0,
    this.mt = 0.0,
    this.mb = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(top: mt!, bottom: mb!, left: ml!, right: mr!),
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
