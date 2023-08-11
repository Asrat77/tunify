import 'dart:convert';
import 'package:http/http.dart' as http;



class createPlayList{
  final String token = 'BQAhv0D-fLV_x2Fx91lTLz_e-_SRzGc0ve-TJetb4xqRMYH0ukpv9hbotYvtPdpnsEQNi56Mfh9DmDtxl6RAJKRolXtIPif6vCAvn8ZkM3BE9i2uOOQNbBFObDfOIq41zKpl77NEDFuf141LfFMCXhi4SWLW9RY-tP5KvfAcFMIzSCwZPMqSg-sEFni0y4uQdXAL5z0JuHOOol5pTLjmcZNWVDARPz4xclJwbDmT5VY7Gn5ZEyroRxYMns0sbQ0totbt4fBn_ry4oheTqolX';

  Future<dynamic> fetchWebApi(String endpoint, String method, dynamic body) async {
  final response = await http.post(
    Uri.parse('https://api.spotify.com/$endpoint'),
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
    body: jsonEncode(body),
  );

  return jsonDecode(response.body);
}

  final List<String> tracksUri = [
  'spotify:track:5l7g0R4Vvl7jlw1rLgfJpZ',
  'spotify:track:5hZDtIXRDmE7Z6BdVZl5HY',
  'spotify:track:5ToaVBXCiPW7QVuTWdSlMa'
  ];

  Future<dynamic> createPlaylist(List<String> tracksUri) async {
    final userResponse = await fetchWebApi('v1/me', 'GET', null);
    final user_id = userResponse['id'];

    final playlistResponse = await fetchWebApi(
      'v1/users/$user_id/playlists', 'POST', {
      'name': 'My recommendation playlist',
      'description': 'Playlist created by the tutorial on developer.spotify.com',
      'public': false,
    },
    );

    final playlistId = playlistResponse['id'];

    await fetchWebApi(
      'v1/playlists/$playlistId/tracks?uris=${tracksUri.join(',')}', 'POST', null);

    return playlistResponse;
    }

    void main() async {
    final createdPlaylist = await createPlaylist(tracksUri);
    print('${createdPlaylist['name']} ${createdPlaylist['id']}');
}}

