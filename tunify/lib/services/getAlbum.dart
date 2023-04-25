// import 'dart:convert';
//
// import 'package:spotify/spotify.dart';
// import 'package:http/http.dart' as http;
// import 'dart:io';
//
// import 'package:query_params/query_params.dart';
//
// void spoty() async {
//   var spotifyApi = SpotifyApi(
//     SpotifyApiCredentials('YOUR_CLIENT_ID', 'YOUR_CLIENT_SECRET'),
//   );
//
//
//
//   var client_id = 'CLIENT_ID';
//   var redirect_uri = 'https://localhost:8888/callback';
//   var callbackUrl = Uri.parse(redirect_uri);
//   //var state = generateRandomString(16);
//   var scope = 'user-read-private user-read-email';
//   //var queryParams = QueryParams({
//     'response_type': 'code',  'client_id': client_id,
//     'scope': scope,  'redirect_uri': redirect_uri,
//     'state': state});
//   var authorizationUrl = Uri.https('accounts.spotify.com', '/authorize', queryParams);
//   var server = await HttpServer.bind(callbackUrl.host, callbackUrl.port);
//   await for (HttpRequest request in server) {  if (request.uri.path == callbackUrl.path) {
//     var code = request.uri.queryParameters['code'];    var receivedState = request.uri.queryParameters['state'];
//     if (state != receivedState) {
//       request.response.statusCode = HttpStatus.badRequest;      await request.response.close();
//       return;    }
//     var tokenUrl = Uri.https('accounts.spotify.com', '/api/token');
//     var response = await http.post(      tokenUrl,
//       headers: {        HttpHeaders.authorizationHeader: 'Basic ' + base64.encode(utf8.encode('$client_id:CLIENT_SECRET')),
//         HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',      },
//       body: {        'grant_type': 'authorization_code',
//         'code': code,        'redirect_uri': redirect_uri,
//       },    );
//     // Handle the API response here
//     // ...
//     request.response.statusCode = HttpStatus.ok;    await request.response.close();
//     await server.close();    return;
//   }
//   }
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
//   final credentials = SpotifyApiCredentials("4b82df7828ac41f7a37f52dbf31675af", "f2d4240fbb61492ea5605106bfd9a492");
//
//   var accessToken = await SpotifyApi.authorizationCodeGrant(credentials).getAuthorizationUrl(Uri.https(''));
//   var tok = '';
//   print(accessToken);
//   var response = await http.get(
//     Uri.https('api.spotify.com', '/v1/search', options),
//     headers: {'Authorization': 'Bearer ' + ''},
//   );
//
//   print(response.body);
//
// /*  if (response.statusCode == 200) {
//     var albums = List<Album>.from(response.data['albums']['items'].map((item) => Album.fromJson(item)));
//     var randomAlbums = albums..shuffle();
//     var selectedAlbums = randomAlbums.take(3);
//
//     for (var album in selectedAlbums) {
//       print(album.name);
//     }
//   } else {
//     print('Error: Failed to get albums.');
//   }*/
// }