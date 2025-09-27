import 'package:flutter/material.dart';
import 'package:shoppingapp/Models/category_model.dart';
import 'package:shoppingapp/Models/productModel.dart';
import 'package:shoppingapp/component/CategoriesTiles.dart';
import 'package:shoppingapp/component/ProductTIles.dart';
import 'package:shoppingapp/constants/colors.dart';
import 'package:shoppingapp/repos/ProductsRepo.dart';
import 'package:shoppingapp/widget/AppWidget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> catList = [];
  List<Productmodel> pList = [];

  @override
  void initState() {
    super.initState();

    // Categories
    catList.add(
      CategoryModel(name: "Headphones", iconPath: "img/headphone.svg"),
    );
    catList.add(CategoryModel(name: "TV", iconPath: "img/tv.svg"));
    catList.add(CategoryModel(name: "Laptop", iconPath: "img/laptop.svg"));
    loadProducts();

    // Products
  }

  void loadProducts() async {
    List<Productmodel> products = await Productsrepo().getProducts();
    setState(() {
      pList = products;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hey, Suraj", style: Appwidget.boldTextFieldStyle()),
                      Text(
                        "Good Morning",
                        style: Appwidget.lightTextFieldStyle(),
                      ),
                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "img/userProfile.png",
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Search
              TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: Appwidget.lightTextFieldStyle(),
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  filled: true,
                  suffixIcon: Icon(Icons.search, color: Colors.black),
                ),
              ),
              SizedBox(height: 30),

              // Categories Title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Categories", style: Appwidget.textFieldStyle1()),
                  Text(
                    "see all",
                    style: Appwidget.textFieldStyle1(textColor: Colors.red),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Categories Row
              Row(
                children: [
                  // "All" Box
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 150,

                        decoration: BoxDecoration(color: Colors.red),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Center(
                            child: Text(
                              "All",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Categories List
                  Expanded(
                    child: SizedBox(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: catList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Categoriestiles(cat: catList[index]),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),

              // Products Title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("All Products", style: Appwidget.textFieldStyle1()),
                  Text(
                    "see all",
                    style: Appwidget.textFieldStyle1(textColor: Colors.red),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Categories Row
              Row(
                children: [
                  // Product List
                  Expanded(
                    child: SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: catList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Producttiles(productmodel: pList[index]),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
