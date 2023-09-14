import 'dart:io';
import 'package:dio/dio.dart';

import '../../../../lib.dart';

class NotifRepoImpl implements NotificationRepository {
  final NotifAPIServices _apiServices;
  NotifRepoImpl(this._apiServices);
  
  @override
  Future<DataState> getListNotif() async {
    UserAuthDb auth = UserAuthDb();
    LoginModel? mods;
    final res = await auth.getUser();
    if (res != null) {
      mods = res;
    }
    var params = NotifListParams(mods?.uid ?? "-", '10', '1');
    var header = 'Bearer ${mods?.accesstoken}';
    try {
      final httpResp = await _apiServices.notifScreenListData(params, header);

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
    UserAuthDb auth = UserAuthDb();
    LoginModel? mods;
    final res = await auth.getUser();
    if (res != null) {
      mods = res;
    }
    var params = NotifApproval(mods?.uid ?? "-", '1');
    var header = 'Bearer ${mods?.accesstoken}';
    try {
      final httpResp =
          await _apiServices.notifScreenApprovalData(params, header);

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
