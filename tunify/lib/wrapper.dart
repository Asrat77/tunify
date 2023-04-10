import 'package:tunify/data/models/user.dart';
import 'package:tunify/ui/screens/login_screen.dart';
import 'package:tunify/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tunify/ui/screens/playlist_screen.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<Auth>(context);
    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<User?> snapshot) {
        if (snapshot.hasData) {
          return const Playlistpage();
        } else {
          return const Login_Screen();
        }
      },
    );
  }
}