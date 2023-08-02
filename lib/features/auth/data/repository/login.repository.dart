import 'dart:io';

import 'package:owl_hris/core/resources/data.state.dart';
import 'package:owl_hris/features/auth/data/data.source/remote/login.services.dart';
import 'package:owl_hris/features/auth/domain/repository/login.repository.dart';
import 'package:dio/dio.dart';

class LoginRepositoryImpl implements UserAuthRepository {
  final String userNm, pwd;
  final LoginAPIServices _loginAPIServices;
  LoginRepositoryImpl(this._loginAPIServices, this.userNm, this.pwd);
  @override
  Future<DataState> loginUser(userNm, pwd) async {
    try {
      final httpResp = await _loginAPIServices.loginUser();

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
}
