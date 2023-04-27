import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'spotify_event.dart';
part 'spotify_state.dart';

class SpotifyBloc extends Bloc<SpotifyEvent, SpotifyState> {
  SpotifyBloc() : super(SpotifyInitial()) {
    on<SpotifyEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
