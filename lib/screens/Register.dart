import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shoppingapp/Models/productModel.dart';
import 'package:shoppingapp/component/Button.dart';
import 'package:shoppingapp/constants/colors.dart';
import 'package:shoppingapp/repos/ProductsRepo.dart';
import 'package:shoppingapp/screens/login.dart';
import 'package:shoppingapp/widget/AppWidget.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final Productsrepo _repo = Productsrepo();

  String? name, email, pass, cpass;
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passcontroller = TextEditingController();
  final TextEditingController cpasscontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future<void> registration() async {
    if (pass != null && cpass != null && name != null && email != null) {
      if (cpass == pass) {
        try {
          UserCredential userCredential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email!, password: pass!);

          Fluttertoast.showToast(msg: "Registration successful");

          // Navigate to login after success
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Login()),
          );
        } on FirebaseAuthException catch (e) {
          Fluttertoast.showToast(msg: e.message ?? "Error occurred");
        }
      } else {
        Fluttertoast.showToast(msg: "Passwords do not match");
      }
    }
  }

  @override
  void initState() {
    super.initState();
    addSampleProduct();
  }

  Future<void> addSampleProduct() async {
    var productmodel = Productmodel(
      pName: "Sample Product",
      pPrice: 100,
      pImg: 'https://example.com/headphone.png',
      pId: "pId",
    );

    // only call addProduct (remove _repo.add() if not implemented)
    await _repo.addProduct(productmodel);

    Fluttertoast.showToast(
      msg: "Sample product added",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "img/login.png",
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    Text("Register", style: Appwidget.textFieldStyle1()),
                    const SizedBox(height: 10),
                    const Text(
                      "Please enter the details below to continue",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name",
                      style: Appwidget.textFieldStyle1(textSize: 25),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: namecontroller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please enter your name";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Full Name",
                        hintStyle: Appwidget.lightTextFieldStyle(),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        suffixIcon: const Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    Text(
                      "Email",
                      style: Appwidget.textFieldStyle1(textSize: 25),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: emailcontroller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please enter your email";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: Appwidget.lightTextFieldStyle(),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        suffixIcon: const Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    Text(
                      "Password",
                      style: Appwidget.textFieldStyle1(textSize: 25),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: passcontroller,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please enter your password";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "*******",
                        hintStyle: Appwidget.lightTextFieldStyle(),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        suffixIcon: const Icon(Icons.lock, color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 20),

                    Text(
                      "Confirm Password",
                      style: Appwidget.textFieldStyle1(textSize: 25),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: cpasscontroller,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please confirm your password";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "*******",
                        hintStyle: Appwidget.lightTextFieldStyle(),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        suffixIcon: const Icon(Icons.lock, color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 20),

                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            name = namecontroller.text;
                            email = emailcontroller.text;
                            pass = passcontroller.text;
                            cpass = cpasscontroller.text;
                          });
                          registration(); // ✅ call registration here
                        }
                      },
                      child: MyBtn(
                        text: "Register",
                        textColor: Colors.white,
                        btnBgColor: Colors.red,
                        radius: 20,
                      ),
                    ),
                    const SizedBox(height: 20),

                    Row(
                      children: [
                        Text(
                          "Already have an account?",
                          style: Appwidget.textFieldStyle1(textSize: 15),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Login(),
                              ),
                            );
                          },
                          child: Text(
                            "Login",
                            style: Appwidget.textFieldStyle1(
                              textSize: 15,
                              textColor: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 70),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
