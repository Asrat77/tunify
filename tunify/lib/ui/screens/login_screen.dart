
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  // @override
  // void signInUser() async {
  //   try {
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: emailController.text.trim(),
  //       password: passwordController.text.trim(),
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == "user-not-found") {
  //       Fluttertoast.showToast(
  //           msg: "Incorrect Email",
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.BOTTOM,
  //           backgroundColor: Colors.red,
  //           textColor: Colors.white);
  //       print("object");
  //     }
  //     if (e.code == "wrong-password") {
  //       Fluttertoast.showToast(
  //         msg: "Incorrect Password.. Try Again!",
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.BOTTOM,
  //         backgroundColor: Colors.red,
  //         textColor: Colors.white,
  //       );
  //     } else {
  //       print(emailController.text);
  //     }
  //   }
  // }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);

    return Scaffold(
      backgroundColor: Colors.black,
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
                        color: Colors.white,
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
                      fillColor: Color.fromARGB(255, 21, 80, 22),
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                      onPressed: () async {
                        print(emailController.text);
                        print(passwordController.text);
                       // final isValid = _formkey.currentState!.validate;
                        await auth
                            .handleSignInEmail(
                                emailController.text, passwordController.text)
                            .then(
                          (value) {
                           // print(emailController.text);
                            Navigator.pushNamed(context, "/pl");
                            //signInUser();
                          },
                        ).catchError((e) => print(e));
                      },
                      child: const Text(
                        "Log in",
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
