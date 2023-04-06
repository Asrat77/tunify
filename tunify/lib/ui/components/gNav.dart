import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

Widget buildGnav(BuildContext context) {
  return Container(
      color: Color.fromARGB(255, 22, 73, 23),
      child: GNav(
        tabs: [
          GButton(
            onPressed: () {
               Navigator.pushNamed(context, "/home");
            },
            icon: Icons.home,
            text: 'Home',
            gap: 8,
          ),
          GButton(
            icon: Icons.search,
            text: 'Search',
            gap: 8,
          ),
          GButton(
            icon: Icons.playlist_add,
            text: 'playlist',
            gap: 8,
            onPressed: () {
              Navigator.pushNamed(context, "/pl");
            },
          ),
          GButton(
            onPressed: () {
              //  Navigator.pushNamed(context, "/playlist");
            },
            icon: Icons.account_circle,
            text: 'User',
            gap: 8,
          )
        ],
      ));
}
