import 'dart:io';

import 'package:owl_hris/core/resources/data.state.dart';
import 'package:owl_hris/features/auth/data/data.source/remote/login.services.dart';
import 'package:owl_hris/features/auth/domain/repository/login.repository.dart';
import 'package:dio/dio.dart';

import '../data.source/local/local.auth.services.dart';

class LoginRepositoryImpl implements UserAuthRepository {
  final String userNm, pwd;
  final LoginAPIServices _loginAPIServices;
  final UserAuthDb db;
  LoginRepositoryImpl(this._loginAPIServices, this.userNm, this.pwd, this.db);
  @override
  Future<DataState> loginUser(userNm, pwd) async {
    var params = LoginParam(userNm, pwd, '1');
    try {
      final httpResp = await _loginAPIServices.loginUser(params);

      if (httpResp.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResp.data);
      } else {
        return DataError(DioException(
          error: httpResp.response.statusMessage,
          response: httpResp.response,
          type: DioExceptionType.badResponse,
          requestOptions: httpResp.response.requestOptions,
        ));
      }
    } on DioException catch (e) {
      return DataError(e);
    }
  }

  @override
  Future<DataState<String>> logoutUser() {
    // TODO: implement logoutUser
    throw UnimplementedError();
  }

  @override
  Future<DataState> verifyLocalUsersCredential() async {
    try {
      final resp = await db.getUserLoginInfo();
      return DataSuccess(resp);
    } on DioException catch (e) {
      return DataError(e);
    }
  }
}
