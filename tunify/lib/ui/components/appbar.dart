import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {


//  final lightTheme = ThemeData(
//       brightness: Brightness.light,
//       primaryColor: Colors.green,
//       accentColor: Colors.yellow,
//       appBarTheme: AppBarTheme(color: Colors.white));

  // // final darkTheme = ThemeData(
  // //   brightness: Brightness.dark,
  // //   primaryColor: Colors.blueGrey[900],
  // //   accentColor: Colors.yellowAccent,
  // //   appBarTheme: AppBarTheme(color: Colors.black)
    

  // );


 

  @override
  Widget build(BuildContext context) {
  
    return 
    AppBar(
      backgroundColor:Color.fromARGB(255, 38, 45, 49),
      actions: [
      
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/settings');
          },
          icon: const Icon(
            Icons.account_circle_outlined,
            size: 33,
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
