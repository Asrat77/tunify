part of 'spotify_bloc.dart';

@immutable
abstract class SpotifyState {}

class SpotifyInitial extends SpotifyState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}


class SpotifyLoading extends SpotifyState{

  @override
  // TODO: implement props
  List<Object> get props => [];


}

class SpotifySuccessState extends SpotifyState {
  List tracks;


  SpotifySuccessState({required this.tracks});

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class SpotifyFailState extends SpotifyState {
  String message;

  SpotifyFailState(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [];
}