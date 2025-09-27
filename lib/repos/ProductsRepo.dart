import 'package:firebase_database/firebase_database.dart';
import 'package:shoppingapp/Models/productModel.dart';

class Productsrepo {
  final DatabaseReference _db = FirebaseDatabase.instance.ref();
  late final DatabaseReference myDb;

  Productsrepo() {
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

  // Fetch all products
  Future<List<Productmodel>> getProducts() async {
    List<Productmodel> pList = [];
    final snapshot = await myDb.get();

    if (snapshot.exists) {
      final data = snapshot.value as Map<dynamic, dynamic>;
      data.forEach((key, value) {
        pList.add(
          Productmodel(
            pId: key,
            pName: value['pName'],
            pPrice: value['pPrice'],
            pImg: value['pImg'],
          ),
        );
      });
    } else {
      pList.add(
        Productmodel(
          pName: "sample",
          pPrice: 0,
          pImg:
              "https://res.cloudinary.com/ddhnyvjzd/image/upload/v1758849833/headphone_ncj3wa.png",
          pId: "sample",
        ),
      );
      return pList;
    }

    return pList;
  }
}
