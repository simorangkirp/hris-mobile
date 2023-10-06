import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';

import '../../../lib.dart';

class HomeReposImpl implements HomeRepository {
  final HomeApiServices _homeAPIServices;
  HomeReposImpl(this._homeAPIServices);
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
    UserAuthDb auth = UserAuthDb();
    var id = uid;
    LoginModel? mods;
    final res = await auth.getUser();
    if (res != null) {
      mods = res;
    }
    var header = 'Bearer ${mods?.accesstoken}';

    try {
      final httpResp = await _homeAPIServices.profileInfo(id, header);

      if (httpResp.response.statusCode == HttpStatus.ok) {
        log('Response Home Data : ${httpResp.data}');
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
