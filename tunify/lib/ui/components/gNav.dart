import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

Widget buildGnav(BuildContext context) {
  return Container(
      color: Colors.black,
      child: GNav(
        tabs: [
          GButton(
            onPressed: () {
               Navigator.pushNamed(context, "/home");
            },
            icon: Icons.home,
           iconColor: Colors.white,
            text: 'Home',textColor: Colors.white,
            gap: 8,
          ),
          GButton(
            icon: Icons.search,
          iconColor: Colors.white,
            
            text: 'Search',textColor: Colors.white,
            gap: 8,
          ),
          GButton(
          
            icon: Icons.playlist_add,
            iconColor: Colors.white,
            
            text: 'playlist',textColor: Colors.white,
            gap: 8,
            onPressed: () {
             
            },
          ),
          GButton(
            onPressed: () {
              //  Navigator.pushNamed(context, "/playlist");
            },
            icon: Icons.account_circle,
             iconColor: Colors.white,
            text: 'User',textColor: Colors.white,
            gap: 8,
          )
        ],
      ));
}
