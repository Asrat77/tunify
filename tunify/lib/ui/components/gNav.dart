import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:tunify/ui/components/appbar.dart';

class gnav extends StatefulWidget {
  const gnav({super.key});

  @override
  State<gnav> createState() => _gnavState();
}

class _gnavState extends State<gnav> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

late final String title;

int _selectedIndex = 0;


@override
@override
Widget buildgnav(BuildContext context) {
  var home = LocaleText("home").data;


  return Stack(
    children: [
      CustomPaint(
        size: Size(MediaQuery.of(context).size.width, 80),
        painter: BNBCustomPainter(),
      ),
      BottomNavigationBar(
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/home');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/q');
          } else {
            Navigator.pushNamed(context, '/play');
          }
        },
        backgroundColor: Colors.transparent,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: Locales.string(context, "home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle,
              size: 40,
            ),
            label: 'create',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.playlist_add_circle),
            label: 'playlist',
          ),
        ],
      ),
    ],
  );
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Color.fromARGB(255, 8, 80, 10);
    Path path = Path()
      ..moveTo(0, 20)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 20)
      ..quadraticBezierTo(size.width / 2, -10, 0, 20)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(CustomPainter oldDelegate) => false;
}
