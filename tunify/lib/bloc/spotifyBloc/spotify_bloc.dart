import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tunify/data/models/track.dart';
import 'package:tunify/services/spotify/spotify.dart';
import 'package:tunify/services/spotify/spotify.dart' as sp;

part 'spotify_event.dart';
part 'spotify_state.dart';

class SpotifyBloc extends Bloc<SpotifyEvent, SpotifyState> {
  final _spotifyService = sp.SpotifyService();

  SpotifyBloc() : super(SpotifyInitial()) {
    on<FetchEvent>((event, emit) async {
      emit(SpotifyLoading());

      try {
        final activity = await SpotifyService.getRecommendations();
        emit(SpotifySuccessState(tracks: activity));
      } catch (e) {
        print(e);
      }
    });
  }
}