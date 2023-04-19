// import 'dart:async';
// import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:url_launcher/url_launcher.dart';

// class QuizPage extends StatefulWidget {
//   const QuizPage({super.key});

//   @override
//   State<QuizPage> createState() => _QuizPageState();
// }

// class _QuizPageState extends State<QuizPage> {
//   int _selectedIndex = -1;
//   bool _isLoading = false;
//   final List<String> _moodOptions = [
//     'Happy',
//     'Sad',
//     'Angry',
//     'Chill',
//     'Romantic',
//   ];
//   Future<void> _generatePlaylist() async {
//     setState(() {
//       _isLoading = true;
//     });
//     final response = await http.get(Uri.parse(
//         'https://api.spotify.com/v1/playlists/37i9dQZF1DZ06evO2qz3Ol/tracks'));
//     final tracks = jsonDecode(response.body)['items'];
//     final List<String> songTitles = [];
//     for (final track in tracks) {
//       songTitles.add(track['track']['name']);
//     }
//     final playlistUrl =
//         'https://open.spotify.com/embed/playlist/37i9dQZF1DZ06evO2qz3Ol';
//     setState(() {
//       _isLoading = false;
//     });
//     await launch(playlistUrl);
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       content: Text('Playlist generated successfully! Enjoy your music!'),
//     ));
//   }

//   final PageController _pageController2 = PageController();
//   final PageController _pageController3 = PageController();

//   final List<String> _titles = [
//     'playlist1',
//     'playlist2',
//     'playlist 3',
//     'playlist 4',
//     'playlist 5',
//   ];

//   final List<String> _subtitles = [
//     'description description  ',
//     'description description  ',
//     'description description  ',
//     'description description  ',
//     'description description ',
//     'description description  ',
//   ];

//   final List<String> _images = [
//     'https://assets.capitalfm.com/2013/13/william--willpower-1365154671-custom-0.png',
//     'https://i.pinimg.com/originals/c6/d3/12/c6d3125b04d046d3751e90390d7ecbe2.jpg',
//     'https://www.stretta-music.com/media/images/952/658952_detail-00.jpg',
//     'https://i.pinimg.com/originals/c6/d3/12/c6d3125b04d046d3751e90390d7ecbe2.jpg',
//     'https://i.pinimg.com/originals/c6/d3/12/c6d3125b04d046d3751e90390d7ecbe2.jpg',
//   ];

//   final double _cardWidth = 150;

//   final PageController _pageController1 = PageController();

//   late Timer _timer;
//   int _currentIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
//       if (_currentIndex < _titles.length - 1) {
//         _currentIndex++;
//       } else {
//         _currentIndex = 0;
//       }
//       _pageController1.animateToPage(
//         _currentIndex,
//         duration: Duration(milliseconds: 500),
//         curve: Curves.easeIn,
//       );
//     });
//   }

//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(177, 255, 255, 255),
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(210, 27, 151, 64),
//         title: Text(
//           'create your own playlist',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Expanded(
//               child: PageView.builder(
//                 controller: _pageController1,
//                 scrollDirection: Axis.horizontal,
//                 itemCount: _titles.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: SizedBox(
//                       width: _cardWidth,
//                       height: 50,
//                       child: Card(
//                         color: Colors.black,
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: <Widget>[
//                             Image.network(
//                               _images[index],
//                               width: _cardWidth,
//                               fit: BoxFit.cover,
//                             ),
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: <Widget>[
//                                       Text(
//                                         _titles[index],
//                                         style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 18,
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                       SizedBox(height: 4),
//                                       Text(
//                                         _subtitles[index],
//                                         style: TextStyle(color: Colors.white),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             const Text(
//               'Your current mood',
//               style: TextStyle(fontSize: 30),
//             ),
//             // Text('create playlist',style: TextStyle(fontSize: 40),),
//             // Padding(
//             //   padding: const EdgeInsets.only(top:15.0, bottom: 250),
//             //   child: SizedBox(

//             //     width: 350,
//             //     child: Container(
//             //       decoration: BoxDecoration(color: Color.fromARGB(255, 51, 51, 51)),
//             //       child: DropdownButton<String>(

//             //         borderRadius: BorderRadius.circular(10),
//             //        dropdownColor: Color.fromARGB(255, 84, 131, 75),

//             //         value: _mood,
//             //         hint: Padding(
//             //           padding: const EdgeInsets.only(left:100.0),
//             //           child: Text('Select your mood',style: TextStyle(color: Colors.white),),
//             //         ),

//             //         onChanged: (value) {
//             //           setState(() {
//             //             _mood = value!;
//             //           });

//             //         },
//             //         items: _moodOptions.map((String mood) {
//             //           return DropdownMenuItem<String>(

//             //             value: mood,
//             //             child: Text(mood,style: TextStyle(color: Colors.white),),
//             //           );
//             //         }).toList(),
//             //       ),
//             //     ),
//             //   ),
//             // ),

//             Expanded(
//               child: ListView.builder(
//                 itemCount: _moodOptions.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return ListTile(
//                     leading: Radio(
//                       groupValue: _selectedIndex,
//                       onChanged: (int? value) {
//                         setState(() {
//                           _selectedIndex = value!;
//                         });
//                       },
//                       value: index,
//                     ),
//                     title: Text(_moodOptions[index]),
//                   );
//                 },
//               ),
//             ),

//             Padding(
//               padding: const EdgeInsets.only(bottom: 41.0),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.black,
//                   fixedSize: Size(200, 50),
//                 ),
//                 onPressed: () {
//                   _isLoading ? null : _generatePlaylist();
//                 },
//                 child: _isLoading
//                     ? SpinKitCircle(color: Colors.green)
//                     : Text(
//                         'Generate Playlist',
//                         style: TextStyle(color: Colors.green),
//                       ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );

//     ;
//   }
// }

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tunify/ui/components/questionary.dart';
import 'package:tunify/ui/screens/playlist_screen.dart';
import 'package:url_launcher/url_launcher.dart';


class mode extends StatefulWidget {
  const mode({super.key});

  @override
  State<mode> createState() => _modeState();
}

bool _isDarkMode = false;

class _modeState extends State<mode> {
  @override
  int _selectedIndex = -1;
  bool _isLoading = false;
  final List<String> _moodOptions = [
    'Happy',
    'Sad',
    'Angry',
    'Chill',
    'Romantic',
  ];
  Future<void> _generatePlaylist() async {
    setState(() {
      _isLoading = true;
    });
    final response = await http.get(Uri.parse(
        'https://api.spotify.com/v1/playlists/37i9dQZF1DZ06evO2qz3Ol/tracks'));
    final tracks = jsonDecode(response.body)['items'];
    final List<String> songTitles = [];
    for (final track in tracks) {
      songTitles.add(track['track']['name']);
    }
    final playlistUrl =
        'https://open.spotify.com/embed/playlist/37i9dQZF1DZ06evO2qz3Ol';
    setState(() {
      _isLoading = false;
    });
    await launch(playlistUrl);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Playlist generated successfully! Enjoy your music!'),
    ));
  }

  final lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.green,
      accentColor: Colors.yellow,
      appBarTheme: AppBarTheme(color: Colors.white));

  final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blueGrey[900],
    accentColor: Colors.yellowAccent,
  );

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

  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'My App',
      theme: _isDarkMode ? darkTheme : lightTheme,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.green,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [
            Switch(
              value: _isDarkMode,
              onChanged: (value) {
                setState(() {
                  _isDarkMode = value;
                });
              },
            )

          ],
// title: 'My App',
      // theme: _isDarkMode ? darkTheme : lightTheme,
      // home: Scaffold(
      //   appBar: AppBar(
      //     actions: [
      //       Switch(
      //         value: _isDarkMode,
      //         onChanged: (value) {
      //           setState(() {
      //             _isDarkMode = value;
      //           });
      //         },
      //       )
      //     ],

          //     Switch(
          //     value: _isDarkMode,
          //     onChanged: (value) {
          //       setState(() {
          //         _isDarkMode = value;
          //       });
          //     },
          // )
        ),
        body: Column(children: [
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
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
                      color: Colors.black,
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
                                    Text(
                                      _subtitles[index],
                                      style: TextStyle(color: Colors.white),
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
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: _moodOptions.length,
          //     itemBuilder: (BuildContext context, int index) {
          //       return ListTile(
          //         leading: Radio(
          //           groupValue: _selectedIndex,
          //           onChanged: (int? value) {
          //             setState(() {
          //               _selectedIndex = value!;
          //             });
          //           },
          //           value: index,
          //         ),
          //         title: Text(_moodOptions[index]),
          //       );
          //     },
          //   ),
          // ),
          const Questionary(),
          // ChoiceCarousel(),
          Padding(
            padding: const EdgeInsets.only(bottom: 41.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                fixedSize: Size(200, 50),
              ),
              onPressed: () {
                _isLoading ? null : _generatePlaylist();
              },
              child: _isLoading
                  ? SpinKitCircle(color: Colors.green)
                  : Text(
                      'Generate Playlist',
                      style: TextStyle(color: Colors.green),
                    ),
            ),

          ),
        ]),
      ),
    );
  }
}