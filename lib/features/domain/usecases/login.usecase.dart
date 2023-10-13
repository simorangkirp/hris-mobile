// import 'package:dartz/dartz.dart';
// import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

import '../../../lib.dart';

// import '../../../../core/error/failures.dart';

class LoginUserUseCase extends UseCase<DataState, LoginParams> {
  final UserAuthRepository _loginRepo;
  LoginUserUseCase(this._loginRepo);
  @override
  Future<DataState> call(LoginParams params) async {
    var res = await _loginRepo.loginUser(params.unm, params.pw);
    return res;
  }
}

class AuthCheckDeviceInfoUsecase extends UseCase<bool, void> {
  final UserAuthRepository _loginRepo;
  AuthCheckDeviceInfoUsecase(this._loginRepo);
  @override
  Future<bool> call(void params) async {
    var res = await _loginRepo.checkDeviceInfo();
    return res;
  }
}

class AuthCheckTokenExp extends UseCase<bool, void> {
  final UserAuthRepository _loginRepo;
  AuthCheckTokenExp(this._loginRepo);
  @override
  Future<bool> call(void params) async {
    var res = await _loginRepo.checkTokenExpire();
    return res;
  }
}

class SaveUserLoginInfoLocally extends UseCase<DataState, void> {
  final UserAuthRepository _repo;
  SaveUserLoginInfoLocally(this._repo);

  @override
  Future<DataState> call(void params) async {
    var res = await _repo.saveUserLoginInfoToLocal();
    return res;
  }
}

class AuthGetProfileDataDetails extends UseCase<DataState, GetProfileParams> {
  final UserAuthRepository _repo;
  AuthGetProfileDataDetails(this._repo);
  @override
  Future<DataState> call(GetProfileParams params) async {
    var res = await _repo.getProfileDetails(params.uid);
    return res;
  }
}

class AuthGetActPeriodUseCase extends UseCase<DataState, GetActPeriodParams> {
  final UserAuthRepository _repo;
  AuthGetActPeriodUseCase(this._repo);
  @override
  Future<DataState> call(GetActPeriodParams params) async {
    var res = await _repo.getAuthActPeriod(params.period, params.lokasi);
    return res;
  }
}

class CheckLocalUserCredential extends UseCase<DataState, void> {
  // final DatabaseHelper db;
  final UserAuthRepository _loginRepo;
  CheckLocalUserCredential(this._loginRepo);

  @override
  Future<DataState> call(void params) async {
    var res = await _loginRepo.verifyLocalUsersCredential();
    // var res = await db.getUserLoginInfo();
    return res;
  }
}

class LoginParams extends Equatable {
  final String unm;
  final String pw;

  const LoginParams({required this.unm, required this.pw});

  @override
  List<Object> get props => [unm, pw];
}
