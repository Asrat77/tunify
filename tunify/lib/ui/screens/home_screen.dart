
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tunify/constants/custom_colors.dart';
import 'package:tunify/ui/components/gNav.dart';

class Home_Screen extends StatefulWidget {
  @override
  _Home_ScreenState createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  final PageController _pageController2 = PageController();
 final PageController _pageController3 = PageController();

  final List<String> _titles = [
    'playlist1',
    'playlist2',
    'playlist 3',
    'playlist 4',
    'playlist 5',
  ];

  final List<String> _subtitles = [
    'description description  ',
    'description description  ',
      'description description  ',
    'description description  ',
    'description description ',

    'description description  ',
  ];

  final List<String> _images = [



    'https://assets.capitalfm.com/2013/13/william--willpower-1365154671-custom-0.png',
    'https://i.pinimg.com/originals/c6/d3/12/c6d3125b04d046d3751e90390d7ecbe2.jpg',

    'https://www.stretta-music.com/media/images/952/658952_detail-00.jpg',

    'https://i.pinimg.com/originals/c6/d3/12/c6d3125b04d046d3751e90390d7ecbe2.jpg',
    'https://i.pinimg.com/originals/c6/d3/12/c6d3125b04d046d3751e90390d7ecbe2.jpg',

  ];

  final double _cardWidth = 150;

  final PageController _pageController1 = PageController();

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
      _pageController1.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 500),
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
      backgroundColor: CustomColors.primaryBlack,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text('data',style: TextStyle(color: Colors.white),),
          SizedBox(
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController1,
                    scrollDirection: Axis.horizontal,
                    itemCount: _titles.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: _cardWidth,

                          child: Card(
                            color: CustomColors.primaryBlack,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Image.network(

                                  _images[index],

                                  width: _cardWidth,
                                  fit: BoxFit.cover,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            _titles[index],
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: CustomColors.primaryWhite,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            _subtitles[index],
                                            style: const TextStyle(color: CustomColors.primaryWhite),
                                          ),
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


              ],
            ),
          ),

Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: const [
        Text('GOOD MORNING',style: TextStyle(color: CustomColors.primaryWhite,fontSize: 30,fontWeight: FontWeight.bold ),),
  ],
),



  Expanded(
            child: ListView.builder(
                itemCount:_titles.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 180,
                        width: 200,
                        child: Card(

                          color: Colors.white10,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [

                                SizedBox(
                                  width: MediaQuery.of(context).size.width*0.52,
                                  height: MediaQuery.of(context).size.height*0.12,

                                  child: Image.network(
                                                    'https://i.pinimg.com/originals/c6/d3/12/c6d3125b04d046d3751e90390d7ecbe2.jpg',
                                       fit: BoxFit.fitWidth,

                                                    // _images[index],
                                                  ),

                                ),






                                 Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                   children: const [
                                     Text(
                                               "new playlist",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 8,
                                                  color: CustomColors.primaryWhite,
                                                ),
                                              ),
                                              Text(
                                            "subtitles,description",
                                            style: TextStyle(color: CustomColors.primaryWhite),
                                          ),


                                   ],
                                 ),
                                       const Icon(Icons.add_sharp,color: CustomColors.primaryGreen,)
                              ],
                            )),
                      ),

                    ],

                  );

                }, ),

          ),




Row(
  mainAxisAlignment: MainAxisAlignment.start,

  children: const [

        Text('Your top mixes',style: TextStyle(color: CustomColors.primaryGreen,fontSize: 40,fontWeight: FontWeight.bold),),
  ],
),






         Expanded(
           child: ListView.builder(
             itemCount:2,
             itemBuilder: (BuildContext context, int index) {
             return
              Card(

             color: Colors.white12,
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 crossAxisAlignment: CrossAxisAlignment.center,

                 children: [

                   SizedBox(
                     width: MediaQuery.of(context).size.width*0.24,
                     height: MediaQuery.of(context).size.height*0.13,
                     child: Image.network(
                                       'https://i.pinimg.com/originals/c6/d3/12/c6d3125b04d046d3751e90390d7ecbe2.jpg',


                                       // _images[index],
                                     ),

                   ),






                    Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                                  "new playlist",
                                   style: TextStyle(
                                     fontWeight: FontWeight.bold,
                                     fontSize: 8,
                                     color: CustomColors.primaryWhite,
                                   ),
                                 ),
                                 Text(
                               "subtitles,description",
                               style: TextStyle(color: Colors.white),
                             ),


                      ],
                    ),
                          const Icon(Icons.add_sharp,color: CustomColors.primaryGreen,)
                 ],
               ))
              ;
            },
           ),
         ),

           ],
      ),
       bottomNavigationBar: buildgnav(context)
    );
  }
}
