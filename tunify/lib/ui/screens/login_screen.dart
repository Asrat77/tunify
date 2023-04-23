
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:tunify/constants/custom_colors.dart';
import 'package:tunify/ui/screens/signUpScreen.dart';

import '../../services/auth.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});
  @override
  State<Login_Screen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Login_Screen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: CustomColors.primaryBlack,
      body: Form(
        child: Center(
          key: _formkey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Tunify",
                      style: TextStyle(
                        color: CustomColors.primaryWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height * .055,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .045,
                  ),
                  TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        hintText: "Email",
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Email is required";
                        }
                        return null;
                      }),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .045,
                  ),

                  TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      filled: true,

                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      hintText: "Password",

                ),
                validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      } else if (value.length < 6) {
                        return "Password should be at least 6 characters";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                       height: MediaQuery.of(context).size.height * .045,
                  ),
              
                  
                 
                  Container(
                    width: double.infinity,
                    child: RawMaterialButton(
                      fillColor: CustomColors.primaryGreen,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                      onPressed: () async {
                            FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text).
                        then((value) {
    Navigator.of(context).popAndPushNamed('/home');
    }).onError((error, stackTrace) {
      print("Error ${error.toString()}");
      Fluttertoast.showToast(msg: error.toString(),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: CustomColors.primaryGreen,
      textColor: CustomColors.secondaryBlack,
      fontSize: 16);}
                            );

                      },
                      child: const Text(
                        "Log in",
                        style: TextStyle(color: CustomColors.primaryWhite, fontSize: 18.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .035,
                  ),
                  Center(
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const signUpscreen()),
                          );
                        },
                        child: const Text("no account yet ?")),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
