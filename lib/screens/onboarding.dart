import 'package:flutter/material.dart';
import 'package:shoppingapp/component/Button.dart';
import 'package:shoppingapp/component/Button2.dart';
import 'package:shoppingapp/constants/colors.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("img/headphone.png"),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Explore\nThe best\nProduxts",
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20.0),
            Align(
              alignment: Alignment.centerRight,
              child: MyBtn2(
                mr: 10,
                text: "Next",
                btnBgColor: Colors.black,
                textColor: Colors.white,
                radius: 30.0,
                width: 110,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
