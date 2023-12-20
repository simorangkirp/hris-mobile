import 'package:intl/intl.dart';

import '../../../lib.dart';
import 'package:dio/dio.dart';

class PaidLeaveImplement implements PaidLeaveRepository {
  // final String userNm, pwd;
  final RemotePaidLeaveServicesImpl remoteServices;
  // final UserAuthDb db;
  PaidLeaveImplement(this.remoteServices);

  @override
  Future<DataState> getPaidLeaveCat() async {
    try {
      final httpResp = await remoteServices.category();

      if (httpResp.response.statusCode! >= 200 &&
          httpResp.response.statusCode! < 300) {
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
  Future<DataState> getPaidLeaveCatDetail(id) async {
    var params = CatDetailBodyParam(id);
    try {
      final httpResp = await remoteServices.categoryDetail(params);

      if (httpResp.response.statusCode! >= 200 &&
          httpResp.response.statusCode! < 300) {
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
  Future<DataState> getPaidLeaveDetail(notxn) async {
    try {
      final httpResp = await remoteServices.paidleaveDetail(notxn);

      if (httpResp.response.statusCode! >= 200 &&
          httpResp.response.statusCode! < 300) {
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
  Future<DataState> getPaidLeaveList(period) async {
    try {
      final httpResp = await remoteServices.paidleavelist(period);

      if (httpResp.response.statusCode! >= 200 &&
          httpResp.response.statusCode! < 300) {
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
  Future<DataState> getPaidLeavePlafond() async {
    try {
      final httpResp = await remoteServices.paidleaveplafond();

      if (httpResp.response.statusCode! >= 200 &&
          httpResp.response.statusCode! < 300) {
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
  Future<DataState> getUserInfo() async {
    UserAuthDb auth = UserAuthDb();
    ProfileModel? mods;
    final res = await auth.getProfileDetail();
    if (res != null) {
      mods = res;
    }
    return DataSuccess(mods);
  }

  @override
  Future<DataState> submitPaidLeave(data) async {
    UserAuthDb auth = UserAuthDb();
    LoginModel? mods;
    final res = await auth.getUser();
    if (res != null) {
      mods = res;
    }
    var splitStr = data.dataCtrl?.text.split(',');

    var params = SubmitPaidLeaveBodyParams(
      mods?.uid ?? "",
      DateFormat('yyyy-MM-dd').format(DateTime.now()),
      data.smbDsc ?? "",
      splitStr?[4] ?? "",
      splitStr?[3] ?? "",
      data.smbCatDet ?? "",
      splitStr?[1] ?? "",
      splitStr?[5] ?? "",
      data.smbFlUpl ?? "",
    );
    try {
      final httpResp = await remoteServices.paidleavesubmit(params);

      if (httpResp.response.statusCode! >= 200 &&
          httpResp.response.statusCode! < 300) {
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
