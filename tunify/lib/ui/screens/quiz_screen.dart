import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tunify/bloc/spotifyBloc/spotify_bloc.dart';
import 'package:tunify/ui/components/appbar.dart';
import 'package:tunify/ui/components/gNav.dart';

class GenreDropdown extends StatefulWidget {
  @override
  _GenreDropdownState createState() => _GenreDropdownState();
}

class _GenreDropdownState extends State<GenreDropdown> {
  String _selectedGenre = 'Pop';

  final List<String> _genres = [
    'Pop',
    'Rock',
    'Hip-Hop',
    'Electronic',
    'Country',
    'Jazz',
    'Classical',
    'R&B',
    'Reggae',
    'Latin',
    'Acoustic'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButtonFormField(
                value: _selectedGenre,
                onChanged: (newValue) {
                  setState(() {
                    _selectedGenre = newValue!;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Select a genre',
                  border: OutlineInputBorder(),
                ),
                items: _genres
                    .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            ))
                    .toList(),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {
                    BlocProvider.of<SpotifyBloc>(context)
                        .add(RecomendEvent(gerne: _selectedGenre));
                    Navigator.pushNamed(context, '/pl');
                  },
                  child: Text("GET RECOMENDATIONS"))
            ],
          ),
        ),
      ),
 bottomNavigationBar: buildgnav(context));
  }
}