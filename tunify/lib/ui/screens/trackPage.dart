import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TracksPage extends StatefulWidget {
  @override
  _TracksPageState createState() => _TracksPageState();
}

class _TracksPageState extends State<TracksPage> {
  List<dynamic> tracks = [];

  @override
  void initState() {
    super.initState();
    fetchTracks();
  }

  Future<void> fetchTracks() async {
    final response = await http.get(Uri.parse('https://api.spotify.com/v1/albums/7c7IgvSrevc0i8gty1WEHI'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      setState(() {
        tracks = json['tracks'];
      });
    } else {
      throw Exception('Failed to fetch tracks');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tracks'),
      ),
      body: ListView.builder(
        itemCount: tracks.length,
        itemBuilder: (BuildContext context, int index) {
          final track = tracks[index];
          final name = track['name'];
          final artist = track['artists'][0]['name'];
          final imageUrl = track['album']['images'][0]['url'];
          return ListTile(
            leading: Image.network(imageUrl),
            title: Text(name),
            subtitle: Text(artist),
          );
        },
      ),
    );
  }
}