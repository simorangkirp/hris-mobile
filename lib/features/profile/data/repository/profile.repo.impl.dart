import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';

import '../../../../lib.dart';

class ProfileRepoImpl implements ProfileRepository{
  final ProfileAPIServices _apiServices;
  ProfileRepoImpl(this._apiServices);
  @override
  Future<DataState> getAbsentInfo(String uid, String period, String onmobile) async{
    var params = ProfileAbsentParams(uid, period, '1');
    UserAuthDb auth = UserAuthDb();
    LoginModel? mods;
    final res = await auth.getUser();
    if (res != null) {
      mods = res;
    }
    var header = 'Bearer ${mods?.accesstoken}';
    try {
      final httpResp = await _apiServices.listAbsentProfileScreen(params, header);

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
  Future<DataState> getAddressInfo(String uid) {
    // TODO: implement getAddressInfo
    throw UnimplementedError();
  }

  @override
  Future<DataState> getEducationInfo(String uid) {
    // TODO: implement getEducationInfo
    throw UnimplementedError();
  }

  @override
  Future<DataState> getEmergencyContact(String uid) {
    // TODO: implement getEmergencyContact
    throw UnimplementedError();
  }

  @override
  Future<DataState> getFamilyInfo(String uid) {
    // TODO: implement getFamilyInfo
    throw UnimplementedError();
  }

  @override
  Future<DataState> getJobHistory(String uid) {
    // TODO: implement getJobHistory
    throw UnimplementedError();
  }

  @override
  Future<DataState> getPayrollInfo(String uid) {
    // TODO: implement getPayrollInfo
    throw UnimplementedError();
  }

  @override
  Future<DataState> getPersonalInfo() {
    // TODO: implement getPersonalInfo
    throw UnimplementedError();
  }

  @override
  Future<DataState> getProfileInfo(String uid)async {
    UserAuthDb auth = UserAuthDb();
    var id = uid;
    LoginModel? mods;
    final res = await auth.getUser();
    if (res != null) {
      mods = res;
    }
    var header = 'Bearer ${mods?.accesstoken}';

    try {
      final httpResp = await _apiServices.profileInfo(id, header);

      if (httpResp.response.statusCode == HttpStatus.ok) {
        log('Response Profile Data : ${httpResp.data}');
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
  Future<DataState> getActPeriod(String lokasi, String period) async{
    var params = ProfileScrnActPeriodParams(period, lokasi);
    UserAuthDb auth = UserAuthDb();
    LoginModel? mods;
    final res = await auth.getUser();
    if (res != null) {
      mods = res;
    }
    var header = 'Bearer ${mods?.accesstoken}';
    try {
      final httpResp = await _apiServices.profileScrnActPeriod(params, header);

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
  
}