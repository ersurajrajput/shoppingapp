import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoppingapp/widget/AppWidget.dart';

class Producttiles extends StatelessWidget {
  const Producttiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.44,

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.network(
                    "https://raw.githubusercontent.com/ersurajrajput/shoppingapp/refs/heads/main/img/headphone.png",
                    width: 100,
                    height: 100,
                  ),
                ),
                Text("Product Name", style: Appwidget.textFieldStyle1()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "\$",
                          style: Appwidget.textFieldStyle1(
                            textColor: Colors.red,
                          ),
                        ),
                        Text(
                          "102",
                          style: Appwidget.textFieldStyle1(
                            textColor: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5),
                      ),

                      width: 30,
                      height: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: SvgPicture.asset(
                          "img/add.svg",
                          colorFilter: const ColorFilter.mode(
                            Colors.white, // 👈 target color
                            BlendMode.srcIn, // replaces pixels with this color
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
