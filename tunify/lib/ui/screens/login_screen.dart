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
                    hintText: "user name",
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
                    hintText: "Password",
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
                    onPressed: () {},
                    child: const Text(
                      "Sign in",
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
                          MaterialPageRoute(builder: (context) => signUpscreen()),
                        );
                      },
                      child: Text("no account yet ?")),
                )
              ],
            ),
          ),
        ),
      ),



    );
  }
}
