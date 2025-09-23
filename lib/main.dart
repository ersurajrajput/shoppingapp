import 'package:flutter/material.dart';
import 'package:shoppingapp/component/Button.dart';
import 'package:shoppingapp/component/ProductTIles.dart';
import 'package:shoppingapp/screens/home.dart';
import 'package:shoppingapp/screens/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: const Home());
  }
}
