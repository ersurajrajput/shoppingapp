import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shoppingapp/Models/productModel.dart';

class Productsrepo {
  final DatabaseReference _db = FirebaseDatabase.instance.ref();
  late final DatabaseReference myDb;

  ProductsRepo() {
    myDb = _db.child("shoppingApp");
  }

  // Add a product
  Future<void> addProduct(Productmodel product) async {
    await _db.push().set({
      "pName": product.pName,
      "pImg": product.pImg,
      "pPrice": product.pPrice,
    });
  }

  // Add a product
  Future<void> add() async {
    await _db.push().set("sms");
  }

  // Fetch all products
  DatabaseReference getProducts() {
    return myDb;
  }
}
