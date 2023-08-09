import 'dart:io';
import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:owl_hris/core/resources/data.state.dart';

import '../../domain/repository/absent.repository.dart';
import '../data.source/remote/absent.services.dart';

class AbsentReposImplement implements AbsentRepository {
  // final String userNm, pwd;
  final AbsentAPIServices _absentAPIServices;
  // final UserAuthDb db;
  AbsentReposImplement(this._absentAPIServices);

  @override
  Future<DataState> getAbsentDetails() {
    // TODO: implement getAbsentDetails
    throw UnimplementedError();
  }

  @override
  Future<DataState> getCurrentPeriodAbsent(id, date, mobile) async {
    var params = ListAbsentParams(id, date, '1');
    var header =
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1aWQiOiJTWlFLTi1OM0c3Qy1YOVJEQyIsInJvbGVpZCI6IjEiLCJpYXQiOjE2OTE1NjY1ODUsImV4cCI6MTY5MTY1Mjk4NSwib25tb2JpbGUiOiIxIn0.MC1HCSTCu2UgWoMW12yuR0nV6iNpJgVE4QepkvPZeV0';
    try {
      final httpResp = await _absentAPIServices.listAbsent(params, header);

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
  Future<List<CameraDescription>> getListCamera() async {
    // Obtain a list of the available cameras on the device.
    final listCamera = await availableCameras();

    // Get a specific camera from the list of available cameras.
    // final firstCamera = cameras.first;
    return listCamera;
  }

  @override
  Future<DataState> submitUserClockIn() {
    // TODO: implement submitUserClockIn
    throw UnimplementedError();
  }
}
