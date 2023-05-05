import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:spotify/spotify.dart' as sp;
=======
import 'package:flutter_locales/flutter_locales.dart';

import 'package:tunify/constants/custom_colors.dart';
import 'package:tunify/ui/components/appbar.dart';
import 'package:tunify/ui/components/gNav.dart';

import '../../bloc/spotifyBloc/spotify_bloc.dart';
import '../../data/models/track.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  _Home_ScreenState createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {

  int iterator = 0;
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
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
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
    return BlocBuilder<SpotifyBloc, SpotifyState>(builder: (context, state) {
      if (state is SpotifyInitial) {
        BlocProvider.of<SpotifyBloc>(context).add(FetchEvent());
      }
      if (state is SpotifyLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is SpotifySuccessState) {
        return Scaffold(
            appBar: MyAppbar(),
            backgroundColor: Color.fromARGB(255, 11, 12, 12),
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
                          itemCount: state.tracks.length,
                          controller: _pageController1,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            final item = state.tracks[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: _cardWidth,
                                child: Card(
                                  color: Colors.white10,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Image.network(
                                        item.imageUrl,
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
                                                Text(
                                                  _titles[index],
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                    color: CustomColors
                                                        .primaryWhite,
                                                  ),
                                                ),
                                                const SizedBox(height: 4),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.43,
                                                  child: Text(
                                                    item.name,
                                                    softWrap: true,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                        color: CustomColors
                                                            .primaryWhite),
                                                  ),
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
                    LocaleText(
                      "goodmorning",
                      style: TextStyle(
                          color: CustomColors.primaryWhite,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                Expanded(
                  child: ListView.builder(
                    itemCount: state.tracks.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, index) {


                      final item = state.tracks[index];
                      return Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: 200,
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
                                        item.imageUrl,
                                        fit: BoxFit.fitWidth,

                                        // _images[index],
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // Text(
                                        //   item.name,
                                        //   style: TextStyle(
                                        //     fontWeight: FontWeight.bold,
                                        //     fontSize: 8,
                                        //     color: CustomColors.primaryWhite,
                                        //   ),
                                        // ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.52,
                                          child: Text(
                                            item.name,
                                            softWrap: true,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color:
                                                    CustomColors.primaryWhite),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Icon(
                                       Icons.add_sharp,





                                      color: CustomColors.primaryGreen,

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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: LocaleText(
                        "yourtopmixes",
                        style: TextStyle(
                          color: CustomColors.primaryWhite,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ],
                ),

                Expanded(
                  child: ListView.builder(
                    itemCount: state.tracks.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = state.tracks[index];
                      final Track trackList = state.tracks[iterator];
                      return GestureDetector(

                          onTap: () {
                            Navigator.pushNamed(context, '/pl');
                          },
                          child: Card(
                              color: Colors.white12,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.24,
                                    height: MediaQuery.of(context).size.height *
                                        0.13,
                                    child: Image.network(
                                      item.imageUrl,
                                      // _images[index],
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "new playlist",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 8,
                                          color: CustomColors.primaryWhite,
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.62,
                                        child: Text(
                                          item.name,
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),

                                  IconButton(onPressed: () {BlocProvider.of<SpotifyBloc>(context)
                                  .add(LikedEvent(track: trackList)); print("object");},

                                      icon: const Icon(Icons.add_sharp))
                                ],
                              )));
                    },
                  ),
                ),
              ],
            ),
            bottomNavigationBar: buildgnav(context));
      }
      return Container();
    });
  }
}
