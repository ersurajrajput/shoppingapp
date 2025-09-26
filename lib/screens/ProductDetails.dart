import 'package:flutter/material.dart';
import 'package:shoppingapp/component/Button.dart';
import 'package:shoppingapp/constants/colors.dart';
import 'package:shoppingapp/widget/AppWidget.dart';

class Productdetails extends StatefulWidget {
  const Productdetails({super.key});

  @override
  State<Productdetails> createState() => _ProductdetailsState();
}

class _ProductdetailsState extends State<Productdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.arrow_back),
                    ),
                  ),

                  Center(child: Image.asset("img/headphone2.png", height: 350)),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),

                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Product Name",
                              style: Appwidget.textFieldStyle1(textSize: 30),
                            ),
                            Text(
                              "\$100",
                              style: Appwidget.textFieldStyle1(
                                textSize: 30,
                                textColor: Colors.red,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text("Details", style: Appwidget.textFieldStyle1()),
                        SizedBox(height: 5),
                        Text(
                          "Experience crystal-clear sound with deep bass and balanced treble. Designed for comfort, these headphones feature soft ear cushions and an adjustable headband for long listening sessions. Perfect for music, movies, and gaming.",
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
                        ),

                        MyBtn(
                          radius: 20,
                          text: "Buy Now",
                          textColor: Colors.white,
                          btnBgColor: Colors.red,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
