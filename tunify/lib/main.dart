import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:tunify/services/auth.dart';
import 'package:tunify/ui/screens/home_screen.dart';
import 'package:tunify/ui/screens/login_screen.dart';
import 'package:tunify/ui/screens/play.dart';
import 'package:tunify/ui/screens/playlist_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tunify/wrapper.dart';

import 'package:tunify/ui/screens/Editprofile.dart';


import 'package:tunify/ui/screens/playlist_screen.dart';
import 'package:tunify/ui/screens/quiz_screen.dart';
import 'package:tunify/ui/screens/setting_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

// class AuthWrapper extends StatelessWidget {
//   const AuthWrapper({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return const Playlist();
//         } else {
//           return const Login_Screen();
//         }
//       },
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        initialRoute: "/",
        routes: {
      "/": (context) =>  Login_Screen(),
      "/pl": (context) => const Playlist(),
         "/home": (context) => Home_Screen(),
         "/q": (context) => const mode(),
          "/settings": (context) => SettingsPage(),
          "/Edit-profile": (context) => EditProfilePage(),
  "/play": (context) => play(),
  
    });
  }
}
