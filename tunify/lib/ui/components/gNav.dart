import 'package:flutter/material.dart';

late final String title;

int _selectedIndex = 0;

List<Widget> _widgetOptions = <Widget>[
  Text('Home'),
  Text('Search'),
  Text('Profile'),
];
@override
@override
Widget buildgnav(BuildContext context) {
  return 
  
  
  
  
   Stack(
    children: [
      CustomPaint(
        size: Size(MediaQuery.of(context).size.width, 80),
        painter: BNBCustomPainter(),
      ),
      BottomNavigationBar(
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/home');
          }
          else if(index==1){
              Navigator.pushNamed(context, '/q');
             
          }
          else{
             Navigator.pushNamed(context, '/pl');
          }
        },
        backgroundColor: Colors.transparent,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle,
              size:40 ,
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
