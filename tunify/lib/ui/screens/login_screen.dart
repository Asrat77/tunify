import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:tunify/ui/screens/signUpScreen.dart';

class Login_Screen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
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
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    hintText: "user",
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .045,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    hintText: Locales.string(context, "home"),
                  ),
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
                    onPressed: () {
                      Navigator.pushNamed(context, "/home");
                    },
                    child: LocaleText(
                      "sign_in",
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
                              builder: (context) => signUpscreen()),
                        );
                      },
                      child: LocaleText("no_acc")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
