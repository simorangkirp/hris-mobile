import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

import '../../domain/entities/login.dart';

abstract class AuthState extends Equatable {
  final LoginEntity? user;
  final DioException? error;
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
  const AuthError(DioException err) : super(error: err);
}
