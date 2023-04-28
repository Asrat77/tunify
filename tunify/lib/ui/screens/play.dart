import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:tunify/bloc/spotifyBloc/spotify_bloc.dart';
import 'package:tunify/ui/components/gNav.dart';
import 'package:tunify/ui/screens/login_screen.dart';

// ignore: camel_case_types
class playpage extends StatelessWidget {
  const playpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}

// ignore: camel_case_types
class play extends StatefulWidget {
  const play({super.key});

  @override
  State<play> createState() => _playState();
}

// ignore: camel_case_types
class _playState extends State<play> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        backgroundColor: Colors.black,
        body: BlocBuilder<SpotifyBloc, SpotifyState>(builder: (context, state) {
          
          if (state is SpotifyInitial) {
            BlocProvider.of<SpotifyBloc>(context).add(FetchEvent());
          }
          if (state is SpotifyLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is SpotifySuccessState) {
            return SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  
                  Container(
                    margin: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 8.0),
                    child: const Text(
                      'My playlist',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    
                    child: GridView.builder(
                    
                    itemCount: state.tracks.length,
                        
                      itemBuilder: (BuildContext context, int index) {
                          final item = state.tracks[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/pl');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 7, color: Colors.white10),
                                borderRadius: BorderRadius.circular(10)),
                            child:  ListTile(
                              
                              leading: CircleAvatar(
                                backgroundColor: Colors.green,
                                child: Center(
                                  
                                  child: Container(
                                    
                                    child: Image.network(item.imageUrl,))),
                              ),
                              title: LocaleText(
                                'title',
                                style: TextStyle(color: Colors.white24),
                              ),
                              subtitle: LocaleText('artist',
                                  style: TextStyle(color: Colors.white)),
                              trailing: Icon(
                                Icons.more_vert,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                    ),
                  ),
                ],
              ),
            );
          }
          return Container();
        }),
        bottomNavigationBar: buildgnav(context));
  }
}
