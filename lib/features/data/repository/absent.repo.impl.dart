import 'dart:io';
import 'package:camera/camera.dart';
import 'package:geolocator/geolocator.dart';

import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';

import '../../../lib.dart';

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
    UserAuthDb auth = UserAuthDb();
    LoginModel? mods;
    final res = await auth.getUser();
    if (res != null) {
      mods = res;
    }
    var header = 'Bearer ${mods?.accesstoken}';
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
  Future<DataState> getUserAssignLoc() async {
    UserAuthDb auth = UserAuthDb();
    LoginModel? mods;
    final res = await auth.getUser();
    if (res != null) {
      mods = res;
    }
    var header = 'Bearer ${mods?.accesstoken}';
    var params = UserAssignLocBody(
      mods?.uid ?? "-",
      DateFormat('yyyy-MM-dd').format(DateTime.now()),
    );

    try {
      final httpResp = await _absentAPIServices.userAssignLoc(params, header);

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
  Future<DataState> submitUserAbsent(data) async {
    Position? post;
    bool isMock = false;

    post = await Geolocator.getCurrentPosition();

    isMock = await Geolocator.getCurrentPosition().then((value) {
      if (value.isMocked) {
        return true;
      }
      return false;
    });

    String loc = "${post.longitude},${post.latitude}";
    LatLng ho = LatLng(-6.277236478788212, 106.79651425937004);

    var dist = calculateDistance(
        post.latitude, post.longitude, ho.latitude, ho.longitude);

    if (dist <= 100 && !isMock) {
      UserAuthDb auth = UserAuthDb();
      LoginModel? mods;
      final res = await auth.getUser();
      if (res != null) {
        mods = res;
      }
      var header = 'Bearer ${mods?.accesstoken}';
      var params = SubmitAbsentBody(
        mods?.uid ?? "-",
        data.date,
        data.period,
        data.absent,
        data.inoutmode,
        data.hr,
        loc,
        data.photo,
        data.desc,
        data.source,
        data.coorphoto,
      );

      try {
        final httpResp = await _absentAPIServices.submitAbsent(params, header);

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
    } else {
      return DataError(
        DioException(
          requestOptions: RequestOptions(),
          message: 'Lokasi di luar wilayah HO.',
          type: DioExceptionType.cancel,
        ),
      );
    }
  }

  @override
  Future<DataState> getUserActPeriod() async {
    UserAuthDb auth = UserAuthDb();
    ActivePeriodModel? mods;
    final res = await auth.getActPeriod();
    if (res != null) {
      mods = res;
    }
    return DataSuccess(mods);
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
  Future<DataState> checkPin(String params) async {
    UserAuthDb auth = UserAuthDb();
    LoginModel? mods;
    final res = await auth.getUser();
    if (res != null) {
      mods = res;
    }
    var header = 'Bearer ${mods?.accesstoken}';
    var data = PINBody(
      mods?.uid ?? "-",
      params,
    );

    try {
      final httpResp = await _absentAPIServices.userPINcheck(data, header);

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
