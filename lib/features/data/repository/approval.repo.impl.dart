import 'dart:io';
import 'package:dio/dio.dart';

import '../../../lib.dart';

class ApprovalRepoImpl implements ApprovalRepository {
  final ApprovalApiServices _apiServices;
  ApprovalRepoImpl(this._apiServices);

  @override
  Future<DataState> getListApproval(type) async {
    UserAuthDb auth = UserAuthDb();
    LoginModel? mods;
    final res = await auth.getUser();
    if (res != null) {
      mods = res;
    }
    var params = ApprovalListParams(mods?.uid ?? "-", type, '1');
    var header = 'Bearer ${mods?.accesstoken}';
    try {
      final httpResp = await _apiServices.listApproval(params, header);

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
  Future<DataState> getApprovalDataDetail(mod) async {
    UserAuthDb auth = UserAuthDb();
    LoginModel? mods;
    final res = await auth.getUser();
    if (res != null) {
      mods = res;
    }
    var params =
        ApprovalDataDetailParams(mods?.uid ?? "-", mod.id, mod.notxn, '1');
    var header = 'Bearer ${mods?.accesstoken}';
    try {
      final httpResp = await _apiServices.approvalDataDetail(params, header);

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
  Future<DataState> submitApprovalData(ApprvSubmitResponseParams data) async {
    UserAuthDb auth = UserAuthDb();
    LoginModel? mods;
    final res = await auth.getUser();
    if (res != null) {
      mods = res;
    }

    var params =
        ApprvSubmitParams(mods?.uid ?? "-", data.id, data.sts, data.desc, null);
    var header = 'Bearer ${mods?.accesstoken}';
    try {
      final httpResp =
          await _apiServices.approvalSubmitResponse(params, header);

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
  Future<DataState> getAppProfile() async {
    UserAuthDb auth = UserAuthDb();
    ProfileModel? mods;
    final res = await auth.getProfileDetail();
    if (res != null) {
      mods = res;
    }
    return DataSuccess(mods);
  }
}
