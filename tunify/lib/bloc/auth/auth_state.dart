import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable{
  @override
  List<Object> get props => [];
}

class UninitializedState extends AuthState {}

class AuthenticatedState extends AuthState {}

class UnauthenticatedState extends AuthState {}

class LoadingAuthenticationState extends AuthState {}
