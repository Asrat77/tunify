import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tunify/bloc/auth_bloc.dart';
import 'package:tunify/services/auth.dart';
import 'package:tunify/ui/screens/home_screen.dart';
import 'package:tunify/ui/screens/login_screen.dart';
import 'package:tunify/ui/screens/playlist_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tunify/wrapper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AuthBloc(FirebaseAuth.instance),
      child: MaterialApp(
          initialRoute: "/home",
          routes: {
            "/home": (context) => const Login_Screen(),
            "/pl": (context) => const Playlist(),
          }),
    );
  }
}
