import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shoppingapp/component/Button.dart';
import 'package:shoppingapp/constants/colors.dart';
import 'package:shoppingapp/screens/Register.dart';
import 'package:shoppingapp/screens/home.dart';
import 'package:shoppingapp/widget/AppWidget.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? email, pass;
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController passcontroller = new TextEditingController();

  Future<void> registration() async {
    if (pass != null && email != null) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email!, password: pass!);

        Fluttertoast.showToast(msg: "Login successful");

        // Navigate to login after success
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );
      } on FirebaseAuthException catch (e) {
        Fluttertoast.showToast(msg: e.message ?? "Error occurred");
      }
    }
  }

  final _key = GlobalKey<FormState>();
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
              SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    Text("Login", style: Appwidget.textFieldStyle1()),
                    SizedBox(height: 10),

                    Text(
                      "Please enter the details below to continue",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: Appwidget.textFieldStyle1(textSize: 25),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: emailcontroller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "cant be empty";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: Appwidget.lightTextFieldStyle(),

                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20),
                        ),

                        filled: true,
                        suffixIcon: Icon(Icons.email, color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Password",
                      style: Appwidget.textFieldStyle1(textSize: 25),
                    ),
                    SizedBox(height: 10),

                    TextFormField(
                      controller: passcontroller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "cant be empty";
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
                        suffixIcon: Icon(Icons.lock, color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 10),

                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "forget password?",
                        style: Appwidget.textFieldStyle1(
                          textSize: 15,
                          textColor: Colors.red,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    GestureDetector(
                      onTap: () {
                        if (_key.currentState!.validate()) {
                          setState(() {
                            email = emailcontroller.text;
                            pass = passcontroller.text;
                          });
                          registration(); // ✅ call registration here
                        }
                      },
                      child: MyBtn(
                        text: "Login",
                        textColor: Colors.white,
                        btnBgColor: Colors.red,
                        radius: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              Row(
                children: [
                  Text(
                    "Dont have an account?",
                    style: Appwidget.textFieldStyle1(textSize: 15),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Register()),
                      );
                    },
                    child: Text(
                      "Sign up",
                      style: Appwidget.textFieldStyle1(
                        textSize: 15,
                        textColor: Colors.red,
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
