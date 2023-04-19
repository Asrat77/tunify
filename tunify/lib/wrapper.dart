import 'package:firebase_auth/firebase_auth.dart';
import 'package:tunify/ui/screens/home_screen.dart';
import 'package:tunify/ui/screens/login_screen.dart';
import 'package:flutter/material.dart';

import 'package:tunify/ui/screens/playlist_screen.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    Stream<User?> authStateChanges = _firebaseAuth.authStateChanges();
    return StreamBuilder(
      stream: authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Home_Screen();
        } else {
          return const Login_Screen();
        }
      },
    );
  }
}
