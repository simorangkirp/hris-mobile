import 'package:equatable/equatable.dart';
// import 'package:dio/dio.dart';

import '../../../../lib.dart';

abstract class AuthState extends Equatable {
  final LoginEntity? user;
  final ErrMsg? error;
  const AuthState({this.user, this.error});
  @override
  List<Object> get props => [user!, error!];
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthInitiallized extends AuthState {}

class ProccessDone extends AuthState {
  const ProccessDone(LoginEntity usr) : super(user: usr);
}

class AuthError extends AuthState {
  const AuthError(ErrMsg err) : super(error: err);
}
