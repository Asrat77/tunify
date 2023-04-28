import 'package:flutter/src/material/dropdown.dart';

class Track {
  final String name;
  final String imageUrl;
  final List<String> artists;
  final String url;

  Track(
      {required this.name,
      required this.artists,
      required this.imageUrl,
      required this.url});

  // Convert Track object to JSON map
  Map<String, dynamic> toJson() => {
    'name': name,
    'imageUrl': imageUrl,
    'artists': artists,
    'url': url,
  };

  // Create a Track object from JSON map
  factory Track.fromJson(Map<String, dynamic> json) {
    return Track(
      name: json['name'],
      imageUrl: json['imageUrl'],
      artists: List<String>.from(json['artists']),
      url: json['url'],
    );
  }



  static map(DropdownMenuItem<Object> Function(dynamic locale) param0) {}
}