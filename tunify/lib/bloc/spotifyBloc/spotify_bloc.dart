import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tunify/data/models/track.dart';
import 'package:tunify/services/spotify/spotify.dart';
import 'package:tunify/services/spotify/spotifyService.dart' as sp;

part 'spotify_event.dart';
part 'spotify_state.dart';

class SpotifyBloc extends Bloc<SpotifyEvent, SpotifyState> {

  final _spotifyService = sp.SpotifyService();


  SpotifyBloc() : super(SpotifyInitial()) {
    on<FetchEvent>((event, emit) async {
      emit(SpotifyLoading());

      final activity = await _spotifyService.getRecommendations();
      emit(SpotifySuccessState(tracks: activity!));
    });

  }
}
