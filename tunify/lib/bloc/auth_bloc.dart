import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
//part 'auth_event.dart';
//part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>{
  final FirebaseAuth _firebaseAuth;

  AuthBloc(this._firebaseAuth):super(Unauthenticated());

  @override
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

