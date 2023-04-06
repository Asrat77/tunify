// import 'package:flutter/material.dart';

// class CurvedNavigationBar extends StatelessWidget {
//   final List<IconData> icons;
//   final Function(int) onTap;

//   CurvedNavigationBar({required this.icons, required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 60.0,
//       child: Stack(
//         children: [
//           CustomPaint(
//             size: Size(MediaQuery.of(context).size.width, 80),
//             painter: CurvedPainter(),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: icons.asMap().entries.map((entry) {
//               final index = entry.key;
//               final icon = entry.value;
//               return GestureDetector(
//                 onTap: () => onTap(index),
//                 child: Icon(
//                   icon,
//                   color: Colors.white,
//                 ),
//               );
//             }).toList(),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CurvedPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()..color = Colors.blue;

//     final path = Path()
//       ..lineTo(0, size.height)
//       ..quadraticBezierTo(
//           size.width / 2, size.height - 40, size.width, size.height)
//       ..lineTo(size.width, 0)
//       ..close();

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }
