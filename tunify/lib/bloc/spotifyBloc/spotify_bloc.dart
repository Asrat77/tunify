import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tunify/data/models/track.dart';
import 'package:tunify/data/repo/db_service.dart';
import 'package:tunify/services/spotify/spotify.dart';
import 'package:tunify/services/spotify/spotify.dart' as sp;

part 'spotify_event.dart';
part 'spotify_state.dart';

class SpotifyBloc extends Bloc<SpotifyEvent, SpotifyState> {
  final _spotifyService = sp.SpotifyService();
  final _service = ServiceLocal();

  List likedSongs=[];
  List likedSongsArr=[];


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
    on<LikedEvent>((event, emit) =>
    {
      if(likedSongsArr.contains(event.data)){
        likedSongsArr.add(event.data),
        _service.saveLiked(event.data),
      }
    });
    on<LikedSongsFetchEvent>((event, emit) async {
      _service.readLiked();}
      );}
  }
