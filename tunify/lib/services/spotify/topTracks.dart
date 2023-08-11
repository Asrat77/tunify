import 'dart:convert';
import 'package:http/http.dart' as http;


class topTracks{

  Future<Map<String, dynamic>> fetchWebApi(String endpoint, String method, dynamic body) async {
    final String token = 'BQAhv0D-fLV_x2Fx91lTLz_e-_SRzGc0ve-TJetb4xqRMYH0ukpv9hbotYvtPdpnsEQNi56Mfh9DmDtxl6RAJKRolXtIPif6vCAvn8ZkM3BE9i2uOOQNbBFObDfOIq41zKpl77NEDFuf141LfFMCXhi4SWLW9RY-tP5KvfAcFMIzSCwZPMqSg-sEFni0y4uQdXAL5z0JuHOOol5pTLjmcZNWVDARPz4xclJwbDmT5VY7Gn5ZEyroRxYMns0sbQ0totbt4fBn_ry4oheTqolX';

    final Uri uri = Uri.https('api.spotify.com', endpoint);
    final http.Response response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch data from the Spotify Web API.');
    }
  }

  Future<List<Map<String, dynamic>>> getTopTracks() async {
    final Map<String, dynamic> response = await fetchWebApi('v1/me/top/tracks?time_range=short_term&limit=5', 'GET', null);
    return (response['items'] as List<dynamic>).cast<Map<String, dynamic>>();
  }

  void main() async {
    final List<Map<String, dynamic>> topTracks = await getTopTracks();
    topTracks?.forEach((track) {
      final String name = track['name'] as String;
      final List<dynamic> artists = track['artists'] as List<dynamic>;
      final String artistNames = artists.map((artist) => artist['name'] as String).join(', ');
      print('$name by $artistNames');
    });
  }
}