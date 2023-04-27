import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tunify/services/spotifyAuth.dart';
import 'package:tunify/ui/screens/Editprofile.dart';

import '../components/gNav.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, "/home");
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),

        ),


      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Text(
              "Settings",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Account",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            buildAccountOptionRow(context, "Edit profile"),



            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.volume_up_outlined,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Notifications",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            buildNotificationOptionRow("New for you", true),
            buildNotificationOptionRow("Account activity", true),
            SizedBox(
              height: 50,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  final client_id = "9fd6560fab6542b7bc370b2d173232b7";
                  final client_secret = "99c592b55d5b4bbcac39db565cb085c0";
                  getAccessToken(client_id, client_secret);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.black),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40),
                ),
                child: Text(
                  'SIGN OUT',
                  style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 2.2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

            )
          ],
        ),
      ),
        bottomNavigationBar: buildgnav(context)

    );

  }

  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: isActive,
              onChanged: (bool val) {},
            ))
      ],

    );
  }
  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/Edit-profile");
      },


  // GestureDetector buildAccountOptionRow(BuildContext context, String title) {
  //   return GestureDetector(
  //     onTap: () {
  //       // Navigator.of(context).pushReplacement(
  //       //   MaterialPageRoute(builder: (context) => Editprofile()),
  //         Navigator.pushNamed(context, "/Edit-profile"
  //       );
  //
  //     },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );

  }
}
