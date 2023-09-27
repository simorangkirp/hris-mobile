import '../../../../lib.dart';
import 'package:dio/dio.dart';

class PaidLeaveImplement implements PaidLeaveRepository {
  // final String userNm, pwd;
  final PaidLeaveAPIService _paidLeaveAPIService;
  // final UserAuthDb db;
  PaidLeaveImplement(this._paidLeaveAPIService);

  @override
  Future<DataState> getPaidLeaveCat() async {
    UserAuthDb auth = UserAuthDb();
    LoginModel? mods;
    final res = await auth.getUser();
    if (res != null) {
      mods = res;
    }
    var header = 'Bearer ${mods?.accesstoken}';

    try {
      final httpResp = await _paidLeaveAPIService.category(header);

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
    UserAuthDb auth = UserAuthDb();
    LoginModel? mods;
    final res = await auth.getUser();
    if (res != null) {
      mods = res;
    }
    var header = 'Bearer ${mods?.accesstoken}';
    var params = CatDetailBody(id);
    try {
      final httpResp =
          await _paidLeaveAPIService.categoryDetail(params, header);

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
    UserAuthDb auth = UserAuthDb();
    LoginModel? mods;
    final res = await auth.getUser();
    if (res != null) {
      mods = res;
    }
    var header = 'Bearer ${mods?.accesstoken}';
    var params = PaidLeaveDetailBody(mods?.uid ?? "", notxn, '1');
    try {
      final httpResp =
          await _paidLeaveAPIService.paidleaveDetail(params, header);

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
    UserAuthDb auth = UserAuthDb();
    LoginModel? mods;
    final res = await auth.getUser();
    if (res != null) {
      mods = res;
    }
    var header = 'Bearer ${mods?.accesstoken}';
    var params = PaidLeaveListBody(mods?.uid ?? "", period, '1');
    try {
      final httpResp = await _paidLeaveAPIService.paidleavelist(params, header);

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
    UserAuthDb auth = UserAuthDb();
    LoginModel? mods;
    final res = await auth.getUser();
    if (res != null) {
      mods = res;
    }
    var header = 'Bearer ${mods?.accesstoken}';
    var params = PlafondBodyParam(mods?.uid ?? "", '1');
    try {
      final httpResp =
          await _paidLeaveAPIService.paidleaveplafond(params, header);

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
  Future<DataState> getUserInfo() async{
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
    var header = 'Bearer ${mods?.accesstoken}';
    var params = PaidLeaveSubmitBody(
        mods?.uid ?? "",
        data.date,
        data.desc,
        data.dtFr,
        data.dtTo,
        data.idType,
        data.totalDay,
        data.returnDay,
        data.fileupload,
        data.typefile,
        '1');
    try {
      final httpResp =
          await _paidLeaveAPIService.paidleavesubmit(params, header);

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
