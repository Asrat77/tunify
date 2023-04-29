import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:pedantic/pedantic.dart';
import 'package:tunify/services/spotify/spotifyAuth.dart';

import '../../data/models/track.dart';
//import 'package:spotify/spotify.dart';

class SpotifyService {
  static Future<List<Track>> getRecommendations(String genre) async {
    const clientId = "a261f7631878463681eac1038e528860";
    const clientSecret = "0ea7cd4598ee431f966757bb2fdde49b";

    String accessToken = await getAccessToken(clientId, clientSecret);

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
    print(genre);
    var response = await http.get(
      Uri.parse(
          '$url?limit=10 &seed_genres=${genre == "" ? "acoustic" : genre.toLowerCase()}'),
      headers: {'Authorization': 'Bearer $accessToken'},
    );
    
    // http.Response response = await http.get(
    //   Uri.parse(url),
    //   headers: {
    //     'Authorization': 'Bearer $accessToken',
    //   },
    // );

    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      print(responseJson);
      // print(responseJson['tracks']);
      var trackList = <Track>[];
      // var tracks = responseJson['tracks']['items'] as List<dynamic>;

      for (var trackJson in responseJson['tracks']) {
        var name = trackJson['album']['name'];
        var imageUrl = trackJson['album']['images'][0]['url'];

        var artistNames = <String>[];
        var artists = trackJson['artists'] as List<dynamic>;
        for (var artistJson in artists) {
          artistNames.add(artistJson['name'] as String);
        }
        var url = trackJson['album']['external_urls']['spotify'];
        var track = Track(
            name: name, artists: artistNames, imageUrl: imageUrl, url: url);
        trackList.add(track);
      }

      return trackList;
    } else {
      throw Exception('Failed to get music recommendations.');
    }
  }
}
