import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';

import '../../../lib.dart';

class HomeReposImpl implements HomeRepository {
  final RemoteDashboardServicesImpl remoteServices;
  HomeReposImpl(this.remoteServices);
  @override
  Future<DataState> getActiveTask() {
    // TODO: implement getActiveTask
    throw UnimplementedError();
  }

  @override
  Future<DataState> getAnnouncementBanner() {
    // TODO: implement getAnnouncementBanner
    throw UnimplementedError();
  }

  @override
  Future<DataState> getProfileInfo(String uid) async {
    try {
      final httpResp = await remoteServices.profileInfo();

      if (httpResp.response.statusCode! >= 200 &&
          httpResp.response.statusCode! < 400) {
        log('Response Home Data : ${httpResp.data}');
        return DataSuccess(httpResp.data);
      } else if (httpResp.response.statusCode == 401) {
        return DataError(DioException(
          requestOptions: httpResp.response.requestOptions,
          response: httpResp.response,
        ));
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
  Future<DataState> getListApprvMsg() async {
    try {
      final httpResp = await remoteServices.dashboardScreenApprovalData();

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
