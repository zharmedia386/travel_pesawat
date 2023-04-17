part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final UserModel user;

  AuthSuccess(this.user);

  @override
  List<Object> get props => [user];
}

class AuthFailed extends AuthState {
  final String error;

  AuthFailed(this.error);

  // List<Object> get props => [id, email, name, hobby, balance]: In this case, the return type of props is a list of non-nullable objects (Object). This means that the individual elements in the list will always be an instance of the Object class and cannot be null.
  @override
  List<Object> get props => [error];
}
