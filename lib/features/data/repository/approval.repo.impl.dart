import 'dart:io';
import 'package:dio/dio.dart';

import '../../../lib.dart';

class ApprovalRepoImpl implements ApprovalRepository {
  final RemoteApprovalServicesImpl remoteServices;
  ApprovalRepoImpl(this.remoteServices);

  @override
  Future<DataState> getListApproval(type) async {
    try {
      final httpResp = await remoteServices.listApproval(type);

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
    var params = ApprovalDataDetailParams(mods?.uid ?? "-", mod.id, mod.notxn);
    try {
      final httpResp = await remoteServices.approvalDataDetail(params);

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
    try {
      final httpResp = await remoteServices.approvalSubmitResponse(params);

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
