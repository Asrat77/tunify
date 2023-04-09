// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

// class home_screen extends StatefulWidget {
//   const home_screen({super.key});

//   @override
//   State<home_screen> createState() => _home_screenState();
// }

// class _home_screenState extends State<home_screen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:
      
      
      
//        ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: 3,
//         itemBuilder: (BuildContext context, int index) {
//           return SafeArea(
//             child: Column(
//               children: [
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height * 0.37,
//                       width: MediaQuery.of(context).size.width * 0.5,
//                       child: Card(
//                           color: Colors.grey,
//                           child: Column(
//                             children: [
//                               Image.network(
//                                 'https://i.pinimg.com/236x/31/88/9c/31889c1cba75cd87a35daca51e2d366e.jpg',
//                                 fit: BoxFit.fill,
//                               ),
//                             ],
//                           )),
//                     ),
                   
//                   ],
//                 ),
//               ],
//             ),
//           );
//         },
       
       
//       ),
//     );
//   }
// }
import 'dart:async';

import 'package:flutter/material.dart';

class AutoScrollableCards extends StatefulWidget {
  @override
  _AutoScrollableCardsState createState() => _AutoScrollableCardsState();
}

class _AutoScrollableCardsState extends State<AutoScrollableCards> {
  final List<String> _titles = [
    'playlist1',
    'playlist2',
    'playlist 3',
    'playlist 4',
    'playlist 5',
  ];

  final List<String> _subtitles = [
    'description ',
    'description ',
    'description ',
    'description ',
    'description ',
  ];

  // final List<String> _images = [
  //   '    https://i.pinimg.com/originals/c6/d3/12/c6d3125b04d046d3751e90390d7ecbe2.jpg',

  //   'https://www.stretta-music.com/media/images/952/658952_detail-00.jpg',
  //   'https://i.pinimg.com/originals/c6/d3/12/c6d3125b04d046d3751e90390d7ecbe2.jpg',

  //   'https://www.stretta-music.com/media/images/952/658952_detail-00.jpg',
  //   'https://i.pinimg.com/originals/c6/d3/12/c6d3125b04d046d3751e90390d7ecbe2.jpg',
  // ];

  final double _cardWidth = 150;

  final PageController _pageController = PageController(viewportFraction: 0.8);

  late Timer _timer;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentIndex < _titles.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      _pageController.animateToPage(
        _currentIndex,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SizedBox(
          height: 150,
          width: 500,
          child: PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            itemCount: _titles.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: _cardWidth,
                  child: Card(
                    color:Color.fromARGB(255, 51, 129, 54),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Image.network(
                 'https://i.pinimg.com/originals/c6/d3/12/c6d3125b04d046d3751e90390d7ecbe2.jpg'
                          // _images[index],
                          ,height: 200,
                           width:_cardWidth,
                          fit: BoxFit.cover,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    _titles[index],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(_subtitles[index],style: TextStyle(color: Colors.white),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        
      ),

      
    );
  }
}


