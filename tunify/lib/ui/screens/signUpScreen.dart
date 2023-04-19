import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:tunify/constants/custom_colors.dart';
import 'package:tunify/ui/screens/login_screen.dart';
import 'package:tunify/services/auth.dart';

class signUpscreen extends StatefulWidget {
  const signUpscreen({super.key});

  @override
  State<signUpscreen> createState() => _signUpscreenState();
}

class _signUpscreenState extends State<signUpscreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullnameController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final auth = Provider.of<Auth>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        key: _formkey,
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: CustomColors.primaryWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height * .055,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .055,
                  ),

                  TextField(
                    //name text field
                    keyboardType: TextInputType.name,
                    controller: fullnameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: CustomColors.primaryWhite,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      hintText: "Full Name",
                    ),
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * .045,
                  ),
                  TextFormField(
                    //email textfeild
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController, //email controller
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: CustomColors.primaryWhite,
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
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .045,
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: CustomColors.primaryWhite,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      hintText: "Password",
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      } else if (value.length < 6) {
                        return 'Password should be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .055,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: RawMaterialButton(
                      fillColor: CustomColors.primaryGreen,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                      onPressed: () {
                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text)
                            .then((value) {
                          Navigator.of(context).pushNamed('/');
                        }).onError((error, stackTrace) {
                          print("Error ${error.toString()}");
                          Fluttertoast.showToast(
                              msg: error.toString(),
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: CustomColors.primaryBlack,
                              textColor: CustomColors.primaryWhite,
                              fontSize: 16.0);
                        });
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
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
                                builder: (context) => Login_Screen()),
                          );
                        },
                        child: Text("Already have an Account?Log In")),
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
