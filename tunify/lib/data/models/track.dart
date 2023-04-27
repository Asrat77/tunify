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

  static map(DropdownMenuItem<Object> Function(dynamic locale) param0) {}
}