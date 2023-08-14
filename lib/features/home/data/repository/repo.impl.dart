import 'package:owl_hris/core/resources/data.state.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import '../../home.dart';

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
    var id = uid;
    var header =
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1aWQiOiJTWlFLTi1OM0c3Qy1YOVJEQyIsInJvbGVpZCI6IjEiLCJpYXQiOjE2OTE1NjY1ODUsImV4cCI6MTY5MTY1Mjk4NSwib25tb2JpbGUiOiIxIn0.MC1HCSTCu2UgWoMW12yuR0nV6iNpJgVE4QepkvPZeV0';

    try {
      final httpResp = await _homeAPIServices.profileInfo(id, header);

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
