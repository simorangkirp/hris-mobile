import 'package:equatable/equatable.dart';
// import 'package:dio/dio.dart';

import '../../../../../lib.dart';

abstract class AuthState extends Equatable {
  final LoginEntity? user;
  final EntityProfile? profileModel;
  final ErrMsg? error;
  final ActivePeriodEntity? actPeriodModel;
  final String? msg;
  final AuthModel? authModel;
  final bool? token;
  final bool? isNotPass;
  const AuthState({
    this.user,
    this.error,
    this.token,
    this.actPeriodModel,
    this.msg,
    this.profileModel,
    this.authModel,
    this.isNotPass,
  });
  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class UserAuthGranted extends AuthState {}

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
  const AuthDetailProfileLoaded(EntityProfile data) : super(profileModel: data);
}

class AuthTokenChecked extends AuthState {
  const AuthTokenChecked(bool authBool, AuthModel data)
      : super(token: authBool, authModel: data);
}

class AuthActPeriodLoaded extends AuthState {
  const AuthActPeriodLoaded(ActivePeriodEntity data)
      : super(actPeriodModel: data);
}

class OnLogOutSuccess extends AuthState {}

class ShowLogoutDialog extends AuthState {}

class AuthCancelSuccess extends AuthState {}

class AuthDeviceChecked extends AuthState {
  const AuthDeviceChecked(bool data) : super(isNotPass: data);
}
