import 'package:equatable/equatable.dart';
// import 'package:dio/dio.dart';

import '../../../../../lib.dart';

abstract class PasswordState extends Equatable {
  final String? msg, pgNm;
  final AuthModel? authModel;
  final bool? isNotPass;
  final String? invErrMsg;
  const PasswordState({
    this.msg,
    this.pgNm,
    this.authModel,
    this.isNotPass,
    this.invErrMsg,
  });
  @override
  List<Object> get props => [];
}

class PasswordLoading extends PasswordState {
  const PasswordLoading();
}

class OTPLoading extends PasswordState {
  const OTPLoading();
}

class PasswordInitiallized extends PasswordState {}

class PasswordOTPResponed extends PasswordState {
  const PasswordOTPResponed(String msg) : super(msg: msg);
}

class PasswordSuccessReset extends PasswordState {
  const PasswordSuccessReset(String data) : super(msg: data);
}

class PasswordError extends PasswordState {
  const PasswordError(String data) : super(msg: data);
}

class PasswordInvalidVersion extends PasswordState {
  const PasswordInvalidVersion(String data) : super(invErrMsg: data);
}
