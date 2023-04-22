import 'dart:async';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:tunify/ui/components/appbar.dart';
import 'package:flutter/material.dart';
import 'package:tunify/ui/components/appbar.dart';
import 'package:tunify/ui/components/gNav.dart';
import 'package:tunify/ui/screens/setting_screen.dart';
import '../components/appbar.dart';

class Home_Screen extends StatefulWidget {
  @override
  _Home_ScreenState createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  final PageController _pageController2 = PageController();
  final PageController _pageController3 = PageController();

  final List<String> _titles = [
    "playlist",
    'playlist',
    'playlist',
    'playlist',
    'playlist',
  ];

  final List<String> _subtitles = [
    "description",
    'description',
    'description',
    'description',
    'description',
    'description',
  ];

  final List<String> _images = [
    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/jazz-international-day-flyer-design-template-bebbb880b30a77a152ac7298c3bad032_screen.jpg?ts=1637033556',
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

    return  Scaffold(
       floatingActionButton:  Icon(Icons.add_circle,size: 50,shadows: [BoxShadow(blurRadius: 2.0,color: Colors.green),]), 
            backgroundColor: Color.fromARGB(255, 16, 20, 24),
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
                                  
                                  color: Color.fromARGB(255, 29, 27, 27),
                                  child: Row(

                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      
                                      Image.network(
                                        _images[index],
                                        width: _cardWidth,
                                        fit: BoxFit.cover,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                LocaleText(
                                                  _titles[index],
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 8,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                SizedBox(height: 4),
                                                LocaleText(
                                                  _subtitles[index],
                                                  style: TextStyle(
                                                      color: Colors.white),
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
                  children: [
                    LocaleText(
                      'popular',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                Expanded(
                  child: ListView.builder(
                    itemCount: _titles.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, index) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 150,
                            width: 150,
                            child: Card(
                                color: Colors.white10,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.52,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.12,
                                      child: Image.network(
                                      _images[index],
                                        fit: BoxFit.fitWidth,

                                        // _images[index],
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        LocaleText(
                                          "newplaylist",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 8,
                                            color: Colors.white,
                                          ),
                                        ),
                                        LocaleText(
                                          "description",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.add_sharp,
                                      color: Colors.green,
                                    )
                                  ],
                                )),
                                
                          ),
                           
                        ],
                       
                      );
                    },
                    
                  ),
                  
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
   
                  children: [
                    LocaleText(
                      'Yourtopmixes',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                Expanded(
                  child: ListView.builder(
                    itemCount:_images.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                          color: Colors.white12,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.24,
                                height:
                                    MediaQuery.of(context).size.height * 0.13,
                                child: Image.network(
                                  'https://i.pinimg.com/originals/c6/d3/12/c6d3125b04d046d3751e90390d7ecbe2.jpg',

                                  // _images[index],
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  LocaleText(
                                    "newplaylist",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 8,
                                      color: Colors.white,
                                    ),
                                  ),
                                  LocaleText(
                                    "description",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.add_sharp,
                                color: Colors.green,
                              )
                            ],
                          ));
                    },
                  ),
                ),
                
              ],
            ),
            bottomNavigationBar: buildgnav(context));
  }
}
