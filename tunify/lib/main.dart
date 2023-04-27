

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
//import 'package:spotify/spotify.dart';
import 'package:tunify/services/auth.dart';
import 'package:tunify/services/spotifyAuth.dart';
//import 'package:tunify/services/getAlbum.dart';
import 'package:tunify/ui/screens/home_screen.dart';
import 'package:tunify/ui/screens/login_screen.dart';
import 'package:tunify/ui/screens/playlist_screen.dart' as pl;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tunify/ui/screens/rec.dart';
import 'package:tunify/wrapper.dart';

import 'package:tunify/ui/screens/Editprofile.dart';
import 'package:uni_links/uni_links.dart';

import 'package:tunify/ui/screens/playlist_screen.dart';
import 'package:tunify/ui/screens/quiz_screen.dart';
import 'package:tunify/ui/screens/setting_screen.dart';


void main() async {

  // final credentials = SpotifyApiCredentials("4b82df7828ac41f7a37f52dbf31675af", "f2d4240fbb61492ea5605106bfd9a492");
  // final spotify =  SpotifyApi(credentials);
  // final artist =  await spotify.artists.get("4NHQUGzhtTLFvgF5SZesLK");

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initUniLinks(context);
    return ChangeNotifierProvider(
      create: (context) => RecommendationsProvider(),

      child: MaterialApp(

          initialRoute: "/",
          routes: {
        "/": (context) => const Wrapper(),
        "/pl": (context) => const pl.Playlist(),
           "/home": (context) => Home_Screen(),
           "/q": (context) => const mode(),
            "/settings": (context) => SettingsPage(),
           // "/rec": (context) = RecommendationsScreen(recommendations: recommendations)
            "/Edit-profile": (context) => EditProfilePage(),
            '/callback': (context) {
          print("object");
              final uri = ModalRoute.of(context)!.settings.arguments as Uri;
              handleSpotifyCallback(uri.queryParameters['code']!);
              return SettingsPage();
            },
          },
          ),
    );
  }

}

void initUniLinks(BuildContext context) async {
  await Future.delayed(Duration(seconds: 1)); // Wait for the platform to initialize
  final initialLink = await getInitialUri();
  _handleLink(initialLink, context);
  getUriLinksStream().listen((Uri? uri) {
    _handleLink(uri, context);
  });
}

void _handleLink(Uri? uri, BuildContext context) {
  if (uri != null && uri.scheme == 'tunify' && uri.host == 'callback') {
    Navigator.pushNamed(
      context,
      '/callback',
      arguments: uri,
    );
  }
}

