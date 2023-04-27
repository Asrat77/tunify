import 'dart:convert';
//import 'dart:html';

import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

final client_id = "9fd6560fab6542b7bc370b2d173232b7";
final client_secret = "99c592b55d5b4bbcac39db565cb085c0";

// Step 1: Redirect the user to the Spotify login page
Future<void> loginWithSpotify() async {
  final clientId = '4b82df7828ac41f7a37f52dbf31675af';
  final redirectUri = 'tunify://callback';
  final scopes = 'user-library-read playlist-modify-public';
  final queryParameters = {
    'client_id': clientId,
    'redirect_uri': redirectUri,
    'scope': scopes,
    'response_type': 'code',
  };
  Uri authEndpoint = Uri.parse('https://accounts.spotify.com/authorize');
  Uri authUrl = authEndpoint.replace(queryParameters: {  'client_id': 'YOUR_CLIENT_ID',
    'redirect_uri': 'YOUR_REDIRECT_URI',});
  final url = Uri.https(
      'accounts.spotify.com',
      'authorize', queryParameters);
  await launch(url.toString());
  if (authEndpoint.path == '/callback') {
    final authCode = authEndpoint.queryParameters['code'];
    print(authCode);
  }
}

// // Step 2: Exchange the authorization code for an access token
// Future<String> getAccessToken(String authorizationCode) async {
//   final clientId = '4b82df7828ac41f7a37f52dbf31675af';
//   final clientSecret = 'f2d4240fbb61492ea5605106bfd9a492';
//   final tokenEndpoint = 'https://accounts.spotify.com/api/token';
//   final headers = {
//     'Content-Type': 'application/x-www-form-urlencoded',
//     'Authorization': 'Basic ${base64Encode(utf8.encode('$clientId:$clientSecret'))}',
//   };
//   final body = {
//     'grant_type': 'authorization_code',
//     'code': authorizationCode,
//     'redirect_uri': 'tunify://callback',
//   };
//   final response = await http.post(Uri.parse(tokenEndpoint), headers: headers, body: body);
//   final responseBody = json.decode(response.body);
//   return responseBody['access_token'];
// }

Future<String> getAccessToken(String clientId, String clientSecret) async {
  final uri = Uri.parse('https://accounts.spotify.com/api/token');

  final headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
    'Authorization':
    'Basic ${base64.encode(utf8.encode('$clientId:$clientSecret'))}',
  };

  final body = 'grant_type=client_credentials';

  final response = await http.post(uri, headers: headers, body: body);

  if (response.statusCode == 200) {
    final token = json.decode(response.body)['access_token'];
    print(token);
    return token;
  } else {
    throw Exception(
        'Failed to get access token: ${response.statusCode} ${response.reasonPhrase}');
  }
}

Future<void> handleSpotifyCallback(String callbackUrl) async {
  final uri = Uri.parse(callbackUrl);

  if (uri.queryParameters.containsKey('code')) {
    final code = uri.queryParameters['code'];
    final accessToken = await getAccessToken(client_id, client_secret);
    print(accessToken);
    print(code);

    // Use the access token to make API requests
    // ...
  } else if (uri.queryParameters.containsKey('error')) {
    final error = uri.queryParameters['error'];
    final description = uri.queryParameters['error_description'];
    print(error);
    print(description);
    // Handle the error
  }
}