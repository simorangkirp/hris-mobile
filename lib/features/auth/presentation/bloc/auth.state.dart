import 'package:equatable/equatable.dart';
// import 'package:dio/dio.dart';

import '../../../../lib.dart';

abstract class AuthState extends Equatable {
  final LoginEntity? user;
  final EntityProfile? profileModel;
  final ErrMsg? error;
  final ActivePeriodEntity? actPeriodModel;
  final String? msg;
  const AuthState({
    this.user,
    this.error,
    this.actPeriodModel,
    this.msg,
    this.profileModel,
  });
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

class AuthStrMsg extends AuthState {
  const AuthStrMsg(String msg) : super(msg: msg);
}

class AuthDetailProfileLoaded extends AuthState {
  const AuthDetailProfileLoaded(EntityProfile data): super(profileModel: data);
}

class AuthActPeriodLoaded extends AuthState {
  const AuthActPeriodLoaded(ActivePeriodEntity data)
      : super(actPeriodModel: data);
}
