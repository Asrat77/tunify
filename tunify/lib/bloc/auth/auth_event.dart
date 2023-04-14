import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';



abstract class AuthEvent extends Equatable{
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class StartedEvent extends AuthEvent{}


class LoggedInEvent extends AuthEvent{
  final User user;

  const LoggedInEvent({required this.user});
  @override
  String toString() => 'LoggedIn { user: ${user.email} }';
}

class LoggedOutEvent extends AuthEvent {}
