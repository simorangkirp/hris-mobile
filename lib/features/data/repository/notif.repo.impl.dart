import 'dart:io';
import 'package:dio/dio.dart';

import '../../../lib.dart';

class NotifRepoImpl implements NotificationRepository {
  final RemoteNotifServicesImpl remoteServices;
  NotifRepoImpl(this.remoteServices);

  @override
  Future<DataState> getListNotif() async {
    try {
      final httpResp = await remoteServices.notifScreenListData();

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
  Future<DataState> getListApproval() async {
    try {
      final httpResp = await remoteServices.notifScreenApprovalData();

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
