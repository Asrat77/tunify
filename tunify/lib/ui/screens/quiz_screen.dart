import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tunify/constants/custom_colors.dart';
import 'package:tunify/ui/components/appbar.dart';
import 'package:tunify/ui/components/gNav.dart';
import 'package:tunify/ui/components/questionary.dart';
import 'package:tunify/ui/screens/playlist_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class mode extends StatefulWidget {
  const mode({super.key});

  @override
  State<mode> createState() => _modeState();
}

bool _islightmmode = false;

class _modeState extends State<mode> {
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
    const playlistUrl =
        'https://open.spotify.com/embed/playlist/37i9dQZF1DZ06evO2qz3Ol';
    setState(() {
      _isLoading = false;
    });
    await launch(playlistUrl);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Playlist generated successfully! Enjoy your music!'),
    ));
  }

  final lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: CustomColors.primaryGreen,
      accentColor: Colors.yellow,
      appBarTheme: const AppBarTheme(color: CustomColors.primaryWhite));

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
      theme: _islightmmode ? lightTheme : darkTheme,
      home: Scaffold(
          appBar: MyAppbar(),
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
                                        style: const TextStyle(
                                            color: CustomColors.primaryWhite),
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

            const Questionary(),
            // ChoiceCarousel(),
            Padding(
              padding: const EdgeInsets.only(bottom: 41.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.primaryBlack,
                  fixedSize: const Size(200, 50),
                ),
                onPressed: () {
                  _isLoading ? null : _generatePlaylist();
                },
                child: _isLoading
                    ? const SpinKitCircle(color: CustomColors.primaryGreen)
                    : const Text(
                        'Generate Playlist',
                        style: TextStyle(color: CustomColors.primaryGreen),
                      ),
              ),
            ),
          ]),
          bottomNavigationBar: buildgnav(context)),
    );
  }
}
