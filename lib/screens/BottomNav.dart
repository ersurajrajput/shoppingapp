import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppingapp/constants/colors.dart';
import 'package:shoppingapp/screens/home.dart';
import 'package:shoppingapp/screens/order.dart';
import 'package:shoppingapp/screens/profile.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  late List<Widget> pages;
  late Home homePage;
  late Orders ordersPage;
  late Profile profilePage;
  int currentTabIndex = 0;

  @override
  void initState() {
    homePage = Home();
    profilePage = Profile();
    ordersPage = Orders();
    pages = [homePage, ordersPage, profilePage];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: AppColors.background,
        buttonBackgroundColor: Colors.blueAccent,

        color: Colors.black,
        items: [
          Icon(Icons.home_outlined, size: 30, color: Colors.white),
          Icon(Icons.shopping_bag_outlined, size: 30, color: Colors.white),
          Icon(Icons.person_outline, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            currentTabIndex = index;
          });
        },
      ),
      body: pages[currentTabIndex],
    );
  }
}
