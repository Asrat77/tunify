// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

// class Login_Screen extends StatefulWidget {
//   @override
//   _Login_ScreenState createState() => _Login_ScreenState();
// }

// class _Login_ScreenState extends State<Login_Screen> {
//   final _formKey = GlobalKey<FormState>();
//   late String _email;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//           child: Center(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 180,
//             ),
//             Center(
//               child: Icon(
//                 Icons.account_circle_outlined,
//                 color: Colors.green,
//               ),
//             ),
//             Center(
//               child: Text(
//                 "Tunify",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 40),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Form(
//                 key: _formKey,

//                 child: Column(

//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [

//                     TextField(

//                       decoration: InputDecoration(hintText: "hello",  border: new OutlineInputBorder(
//                             borderSide: new BorderSide(
//                               color: Colors.teal,),)
//     //                          ,fillColor: Colors.green,border: OutlineInputBorder(

//     //  borderRadius: BorderRadius.all(

//     //      Radius.circular(20.0),

// //     //  ),
// //      borderSide: BorderSide(color: Colors.green)
// // ),

// ),

//                       // validator: (value) {

//                       //   TextStyle(color: Colors.white);
//                       //   if (value!.isEmpty) {
//                       //     return 'Please enter your email';
//                       //   }
//                       //   return null;
//                       // },
//                       // onSaved: (value) {
//                       //   _email = value!;
//                       // },
//                     ),
//                     SizedBox(height: 16),
//                     ElevatedButton(
//                        style: ElevatedButton.styleFrom(
//                        backgroundColor: Colors.green, // Set background color here
//                         ),

//                       child: Text(
//                         'Sign In',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       onPressed: () {
//                         if (_formKey.currentState!.validate()) {
//                           _formKey.currentState!.save();
//                           // TODO: implement sign in logic using the email
//                         }
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       )),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:tunify/ui/screens/signUpScreen.dart';

class Login_Screen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  'Tunify',
                  style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Column(
                  children: [
                    TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(color: Colors.green)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(color: Colors.green)),
                          labelText: 'Username',
                          labelStyle: TextStyle(color: Colors.green)),
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(color: Colors.green)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        labelText: 'Password',
                      ),
                      obscureText: true,
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 0),

                    SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                        ),
                        onPressed: () {
                          // Perform login action here
                          Navigator.pushNamed(context, "/home");
                        },
                        child: Text('LOG IN'),
                      ),
                    ),
                    //to do add push named to sign up screen.
                    // , child: Text("No account yet?"))
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const signUpscreen()),
                          );
                        },
                        child: Text("No account yet?")),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
