import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:tunify/bloc/spotifyBloc/spotify_bloc.dart';
import 'package:tunify/services/auth.dart';

import 'package:tunify/ui/screens/home_screen.dart';
import 'package:tunify/ui/screens/language.dart';
import 'package:tunify/ui/screens/liked-songs.dart';
import 'package:tunify/ui/screens/login_screen.dart';
import 'package:tunify/ui/screens/play.dart';
import 'package:tunify/ui/screens/playlist_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tunify/wrapper.dart';

import 'package:tunify/ui/screens/Editprofile.dart';

import 'package:tunify/ui/screens/quiz_screen.dart';
import 'package:tunify/ui/screens/setting_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  WidgetsFlutterBinding.ensureInitialized();
  await Locales.init(['en', 'fa', 'ps', 'am']);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LocaleBuilder(
        builder: (locale) => MultiBlocProvider(
              providers: [BlocProvider(create: (context) => SpotifyBloc())],
              child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates: Locales.delegates,
                  supportedLocales: Locales.supportedLocales,
                  locale: locale,
                  initialRoute: "splash",
                  routes: {
                    'splash': (context) => const SpotifySplashScreen(),
                    "/": (context) => const Wrapper(),
                    "/pl": (context) => const Playlist(),
                    "/home": (context) => const Home_Screen(),
                    "/q": (context) => GenreDropdown(),
                    "/settings": (context) => SettingsPage(),
                    "/Edit-profile": (context) => EditProfilePage(),
                    "/play": (context) => const play(),
                    "liked-songs": (context) => const LikedSongs(),
                    "/ls": (context) => const languageScreen(),
                    "/login": (context) => const Login_Screen(),
                  }),
            ));
  }
}

class SpotifySplashScreen extends StatefulWidget {
  const SpotifySplashScreen({super.key});


    return LocaleBuilder(builder: (locale)=>


   MultiBlocProvider(
     providers: [
       BlocProvider(create: (context) => SpotifyBloc())
     ],
     child: MaterialApp(
       debugShowCheckedModeBanner: false,
      localizationsDelegates: Locales.delegates,
            supportedLocales: Locales.supportedLocales,
            locale: locale,
          initialRoute: "/",
          routes: {
        "/": (context) => const Wrapper(),
        "/liked-songs": (context) => const Playlist(),
           "/home": (context) => const Home_Screen(),
           "/q": (context) =>  const mode(),
            "/settings": (context) => SettingsPage(),
            "/Edit-profile": (context) => EditProfilePage(),
             "/play": (context) => const play(),
             "/ls":(context) =>const languageScreen(),
            "/login":(context) =>const Login_Screen(),

  @override
  _SpotifySplashScreenState createState() => _SpotifySplashScreenState();
}


class _SpotifySplashScreenState extends State<SpotifySplashScreen> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() {
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(CupertinoPageRoute(
        builder: (BuildContext context) => const Login_Screen(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: NetworkImage(
                  'https://i.pinimg.com/originals/7e/4f/89/7e4f892475aca7242883ceaf8aa89cc9.jpg'),
              fit: BoxFit.fitWidth,
              height: 500,
             width: 500,
            ),
            const SizedBox(height: 30),
            BlocBuilder<SpotifyBloc, SpotifyState>(
              builder: (context, state) {
                if (state is SpotifyInitial) {
                  return Container(
                    child: const Text(
                    
                  overflow: TextOverflow.ellipsis,
                      'Loading...',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                } else {
                  return const Text(
                    'Welcome to Spotify!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
