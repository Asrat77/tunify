import 'dart:async';
import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:pedantic/pedantic.dart';
import 'package:tunify/services/spotify/spotifyAuth.dart';

import '../../data/models/track.dart';
//import 'package:spotify/spotify.dart';


class SpotifyService{

  static Future<List<Track>> getRecommendations() async {

    String accessToken = await getAccessToken(client_id,client_secret);

    Map<String, double> parameterValues = {
      'tempo': 0.5,
      'mode': 0.7,
      'speechiness': 0.2,
      'acousticness': 0.8,
      'instrumentalness': 0.1,
    };

    String parameterString = '';
    parameterValues.forEach((parameter, normalizedScore) {
      parameterString += '$parameter:$normalizedScore,';
    });
    parameterString = parameterString.substring(0, parameterString.length - 1);

    String url = 'https://api.spotify.com/v1/recommendations?$parameterString';

    var response = await http.get(
      Uri.parse('$url?limit=10 &seed_genres=acoustic'),
      headers: {'Authorization': 'Bearer $accessToken'},


    );

    // http.Response response = await http.get(
    //   Uri.parse(url),
    //   headers: {
    //     'Authorization': 'Bearer $accessToken',
    //   },
    // );

    if (response.statusCode == 200) {
      print(response.body);
      var responseJson = jsonDecode(response.body);



      var trackList = <Track>[];
      var tracks = responseJson['tracks']['items'] as List<dynamic>;


      for (var trackJson in tracks) {
        var name = trackJson['name'] as String;
        var imageUrl = trackJson['album']['images'][0]['url'] as String;

        var artistNames = <String>[];
        var artists = trackJson['artists'] as List<dynamic>;
        for (var artistJson in artists) {
          artistNames.add(artistJson['name'] as String);
        }
        var track = Track(name: name, artists: artistNames, imageUrl: imageUrl);
        trackList.add(track);
      }


      return trackList;



    } else {
      throw Exception('Failed to get music recommendations.');
    }

  }
}
