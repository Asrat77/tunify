import 'package:flutter/material.dart';
import 'package:tunify/ui/screens/home_screen.dart';
import 'package:tunify/ui/screens/login_screen.dart';
import 'package:tunify/ui/screens/playlist_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: "/", routes: {
      "/": (context) => Login_Screen(),
      "/pl": (context) => Playlist(),
         "/home": (context) => AutoScrollableCards(),
    });
  }
}
