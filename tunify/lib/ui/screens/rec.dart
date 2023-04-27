import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/track.dart';



class RecommendationsProvider with ChangeNotifier {
  List<Track> _recommendations = [];

  List<Track> get recommendations => _recommendations;

  set recommendations(List<Track> value) {
    _recommendations = value;
    notifyListeners();
  }
}

class RecommendationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var recommendations = Provider.of<RecommendationsProvider>(context).recommendations;

    return Scaffold(
      appBar: AppBar(
        title: Text('Music Recommendations'),
      ),
      body: ListView.builder(
        itemCount: recommendations.length,
        itemBuilder: (context, index) {
          var track = recommendations[index];
          return ListTile(
            leading: Image.network(track.imageUrl),
            title: Text(track.name),
            subtitle: Text(track.artists.join(', ')),
          );
        },
      ),
    );
  }
}