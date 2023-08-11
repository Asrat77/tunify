import 'dart:convert';
import 'package:http/http.dart' as http;


class trackRecs{


  void main() async {
    final token = 'BQAhv0D-fLV_x2Fx91lTLz_e-_SRzGc0ve-TJetb4xqRMYH0ukpv9hbotYvtPdpnsEQNi56Mfh9DmDtxl6RAJKRolXtIPif6vCAvn8ZkM3BE9i2uOOQNbBFObDfOIq41zKpl77NEDFuf141LfFMCXhi4SWLW9RY-tP5KvfAcFMIzSCwZPMqSg-sEFni0y4uQdXAL5z0JuHOOol5pTLjmcZNWVDARPz4xclJwbDmT5VY7Gn5ZEyroRxYMns0sbQ0totbt4fBn_ry4oheTqolX';

    List<String> topTracksIds = [
      '5l7g0R4Vvl7jlw1rLgfJpZ',
      '5ToaVBXCiPW7QVuTWdSlMa',
      '6WUMJCjZnatR6CbIcczDnr',
      '4q5UlYGp3arPnpSFdyWsga',
      '6aBUnkXuCEQQHAlTokv9or',
    ];

    List<Map<String, dynamic>> recommendedTracks = await getRecommendations(token, topTracksIds);

    recommendedTracks.forEach((track) {
      List<String> artists = List<String>.from(track['artists'].map((artist) => artist['name']));
      String trackName = track['name'];
      String artistsString = artists.join(', ');
      print('$trackName by $artistsString');
    });
  }

  Future<List<Map<String, dynamic>>> getRecommendations(String token, List<String> topTracksIds) async {
    final endpoint = 'v1/recommendations?limit=5&seed_tracks=${topTracksIds.join(',')}';
    final url = Uri.https('api.spotify.com', endpoint);

    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return List<Map<String, dynamic>>.from(data['tracks']);
    } else {
      throw Exception('Failed to fetch recommendations');
    }
  }

}

