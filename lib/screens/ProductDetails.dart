import 'package:flutter/material.dart';

class Productdetails extends StatefulWidget {
  const Productdetails({super.key});

  @override
  State<Productdetails> createState() => _ProductdetailsState();
}

class _ProductdetailsState extends State<Productdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Image.network(
                width: 400,
                height: 400,
                "https://raw.githubusercontent.com/ersurajrajput/shoppingapp/refs/heads/main/img/headphone2.png",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
