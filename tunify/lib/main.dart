import 'package:flutter/material.dart';
import 'package:tunify/ui/screens/Editprofile.dart';
import 'package:tunify/ui/screens/home_screen.dart';
import 'package:tunify/ui/screens/login_screen.dart';
import 'package:tunify/ui/screens/play.dart';
import 'package:tunify/ui/screens/playlist_screen.dart';
import 'package:tunify/ui/screens/quiz_screen.dart';
import 'package:tunify/ui/screens/setting_screen.dart';

void main() {
  runApp(const MyApp());
}

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
