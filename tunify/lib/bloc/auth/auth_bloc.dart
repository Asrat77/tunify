/*
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
//part 'auth_event.dart';
//part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>{
  final FirebaseAuth _firebaseAuth;

  AuthBloc(this._firebaseAuth):super(Unauthenticated());

  Stream<AuthState>
  mapEventToState(AuthEvent event) async* {
    if(event is AppStarted) {
      try {
        User? user = _firebaseAuth.currentUser;
        if (user != null) {
          yield Authenticated(user: user);
        }
        else {
          yield Unauthenticated();
        }
      }
      catch (e) {
        yield Unauthenticated();
      }
    }
    else if (event is LoggedIn) {
      yield Authenticated(user: event.user);
    }
    else if(event is LoggedOut){
      yield Unauthenticated();
    }
  }
}

abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}
class Unauthenticated extends AuthState{}

class Authenticated extends AuthState {
    final User user;
    const Authenticated({required this.user});

    @override
  List<Object> get props => [user];
}

abstract class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object> get props => [];
}
class AppStarted extends AuthEvent {}

class LoggedIn extends AuthEvent {
  final User user;
  const LoggedIn({required this.user});
  @override
  List<Object> get props => [user];
}

class LoggedOut extends AuthEvent{}


*/

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tunify/data/models/user.dart' as tunify;
import 'package:tunify/bloc/auth/auth_state.dart';
import 'package:tunify/bloc/auth/auth_event.dart';
import 'package:tunify/services/auth.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState>{
  final Auth auth;
  tunify.User user;


  AuthBloc(AuthState initialState,
      this.auth,
      this.user,)
  : super(initialState);

  Stream<AuthState> mapEventToState(
      AuthEvent event) async*{
    if(event is StartedEvent){
      yield* _handleAuthEventStarted();
    }
    if(event is LoggedInEvent){
      yield* _handleLoginEvent(event);
    }
    if(event is LoggedOutEvent){
      yield* _handleLogoutEvent();
    }
  }
  Stream<AuthState> _handleAuthEventStarted() async*{
    yield LoadingAuthenticationState();
    if(auth.isLoggedIn){
      user.token = await auth.token;
      yield AuthenticatedState();
    } else{
      yield UnauthenticatedState();
    }}

    Stream<AuthState> _handleLogoutEvent() async* {
      yield LoadingAuthenticationState();
      user.token = "";
      yield UnauthenticatedState();
    }
  Stream<AuthState>  _handleLoginEvent(LoggedInEvent event) async* {

    yield LoadingAuthenticationState();



    user.token= await event.user.getIdToken();
    yield AuthenticatedState();


  }

}








