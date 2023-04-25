// /*
// library spotify;
//
// import 'dart:async';
// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
// import 'package:oauth2/oauth2.dart' as oauth2;
// import 'package:pedantic/pedantic.dart';
// import 'package:spotify/spotify.dart';
//
// import '../spotify//models/_models.dart';
//
// export 'package:oauth2/oauth2.dart'
//     show AuthorizationException, ExpirationException;
//
// export '../spotify//models/_models.dart';
//
//
// final credentials = SpotifyApiCredentials("4b82df7828ac41f7a37f52dbf31675af", "f2d4240fbb61492ea5605106bfd9a492");
// final spotify = SpotifyApi(credentials);
// final artist =  spotify.artists.get('0OdUWJ0sBjDrqHygGUXeCF');
//
//
// Future<String> getAccessToken() async {
//   String clientId = '4b82df7828ac41f7a37f52dbf31675af';
//   String clientSecret = 'f2d4240fbb61492ea5605106bfd9a492';
//
//   String basicAuth = base64.encode(utf8.encode('$clientId:$clientSecret'));
//
//   String url = 'https://accounts.spotify.com/api/token';
//
//   http.Response response = await http.post(
//     Uri.parse(url),
//     headers: {
//       'Authorization': 'Basic $basicAuth',
//       'Content-Type': 'application/x-www-form-urlencoded',
//     },
//     body: {
//       'grant_type': 'client_credentials',
//     },
//   );
//
//   if (response.statusCode == 200) {
//     Map<String, dynamic> jsonResponse = json.decode(response.body);
//     String accessToken = jsonResponse['access_token'];
//     return accessToken;
//   } else {
//     throw Exception('Failed to get access token.');
//   }
// }
//
//
// void _getRecommendations() async {
//   String accessToken = await getAccessToken();
//
//   Map<String, double> parameterValues = {
//     'tempo': 0.5,
//     'mode': 0.7,
//     'speechiness': 0.2,
//     'acousticness': 0.8,
//     'instrumentalness': 0.1,
//   };
//
//   String parameterString = '';
//   parameterValues.forEach((parameter, normalizedScore) {
//     parameterString += '$parameter:$normalizedScore,';
//   });
//   parameterString = parameterString.substring(0, parameterString.length - 1);
//
//   String url = 'https://api.spotify.com/v1/recommendations?$parameterString';
//
//   http.Response response = await http.get(
//     Uri.parse(url),
//     headers: {
//       'Authorization': 'Bearer $accessToken',
//     },
//   );
//
//   if (response.statusCode == 200) {
//     // parse the response and do something with the recommendations
//   } else {
//     throw Exception('Failed to get music recommendations.');
//   }
//
// }
//
//
//
// void main() async {
//   var spotify = SpotifyApi(
//     SpotifyApiCredentials('YOUR_CLIENT_ID', 'YOUR_CLIENT_SECRET'),
//   );
//
//   var query = 'year:2015';
//   var limit = 10;
//
//   var options = <String, Object>{
//     'q': query,
//     'type': 'album',
//     'limit': limit.toString(),
//     'offset': (0).toString(),
//     'market': 'US',
//     'seed_genres': 'rock',
//     'seed_artists': '4NHQUGzhtTLFvgF5SZesLK',
//   };
//
// */
