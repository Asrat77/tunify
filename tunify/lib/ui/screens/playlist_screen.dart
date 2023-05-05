import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:tunify/ui/components/appbar.dart';
import 'package:tunify/ui/components/gNav.dart';
import 'package:tunify/ui/screens/login_screen.dart';

import '../../bloc/spotifyBloc/spotify_bloc.dart';
import '../../services/spotify/spotify.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: camel_case_types
class Playlistpage extends StatelessWidget {
  const Playlistpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}

// ignore: camel_case_types
class Playlist extends StatefulWidget {
  const Playlist({super.key});

  @override
  State<Playlist> createState() => _PlaylistState();
}

// ignore: camel_case_types
class _PlaylistState extends State<Playlist> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpotifyBloc, SpotifyState>(
      builder: (context, state) {
        if (state is SpotifyInitial) {
          BlocProvider.of<SpotifyBloc>(context).add(const LikedSongsFetchEvent());
        }
        if (state is SpotifyLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is SpotifySuccessState) {
          return Scaffold(
              appBar: MyAppbar(),
              backgroundColor: Colors.black,
              body: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 8.0),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.tracks.length,
                        
                        itemBuilder: (BuildContext context, int index) {
                          
                          final item = state.tracks[index];
                          // final ite = item.artists[index];
                          return InkWell(
                            onTap: () async {
                              if (await canLaunch(item.url)) {
                                await launch(item.url,
                                    forceSafariVC: false, forceWebView: false);
                              } else {
                                throw 'Could not launch ${item.url}';
                              }
                            },

child: Container(
                      
                      decoration: BoxDecoration(
                        
                          border: Border.all(width: 7, color: Colors.white10),
                          borderRadius: BorderRadius.circular(10)),
                      child:  ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.green,
                          child: Center(child: Image.network(item.imageUrl)),
                        ),
                        
                        title: Text(
                          item.name,
                          style: TextStyle(color: Colors.white24),
                        ),
                        subtitle: Text(item.name,
                            style: TextStyle(color: Colors.white)),
                        trailing: Icon(
                          Icons.more_vert,
                          color: Colors.green,
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
              bottomNavigationBar: buildgnav(context));
        }
        return Container();
      },
    );
  }
}
