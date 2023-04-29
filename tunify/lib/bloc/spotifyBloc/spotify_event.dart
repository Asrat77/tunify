part of 'spotify_bloc.dart';

@immutable
abstract class SpotifyEvent extends Equatable {
  const SpotifyEvent();
}

class FetchEvent extends SpotifyEvent {
  const FetchEvent();
  @override
  List<Object> get props => [];
}

class RecomendEvent extends SpotifyEvent {
  final String gerne;
  const RecomendEvent({required this.gerne});
  @override
  List<Object> get props => [];

  get data => this.gerne;
}

class TrackEvent extends SpotifyEvent {
  final Track track;

  TrackEvent({required this.track});

  @override
  List<Object> get props => [];

  get data => track;
}

class LikedEvent extends SpotifyEvent {
  final Track track;

  LikedEvent({required this.track});

  @override
  List<Object> get props => [];

  get data => track;
}