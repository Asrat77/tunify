
part of 'likedBloc.dart';



abstract class LikedState extends Equatable {
  const LikedState();

  @override
  List<Object> get props => [];
}


class LikedInitial extends LikedState {}


class LikedLoading extends LikedState {}


class LikedSuccess extends LikedState {

  List tracks;

  LikedSuccess({required this.tracks});


}




