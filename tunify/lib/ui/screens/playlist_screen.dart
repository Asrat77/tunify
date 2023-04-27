import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:tunify/ui/components/appbar.dart';
import 'package:tunify/ui/components/gNav.dart';
import 'package:tunify/ui/screens/login_screen.dart';

import '../../services/spotify/spotify.dart';

// ignore: camel_case_types
class Playlistpage extends StatelessWidget {
  const Playlistpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}

// ignore: camel_case_types
class Playlist extends StatefulWidget {
  const Playlist({super.key});

  @override
  State<Playlist> createState() => _PlaylistState();
}

// ignore: camel_case_types
class _PlaylistState extends State<Playlist> {
  @override
  Widget build(BuildContext context) {
    test()  {
      final list =  SpotifyService.getRecommendations();
      return list;
    }

    print(test());
    return Scaffold(
        appBar: MyAppbar(),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 8.0),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 7, color: Colors.white10),
                          borderRadius: BorderRadius.circular(10)),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: buildgnav(context));
  }
}
