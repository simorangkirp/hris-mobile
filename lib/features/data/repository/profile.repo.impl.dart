import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';

import '../../../lib.dart';

class ProfileRepoImpl implements ProfileRepository {
  final RemoteProfileServicesImpl remoteServices;
  ProfileRepoImpl(this.remoteServices);
  @override
  Future<DataState> getAbsentInfo(
      String uid, String period, String onmobile) async {
    var params = UIDPeriodParams(uid, period);
    try {
      final httpResp = await remoteServices.listAbsentProfileScreen(params);

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
  Future<DataState> getAddressInfo() async {
    try {
      final httpResp = await remoteServices.addressInfo();

      if (httpResp.response.statusCode == HttpStatus.ok) {
        log('Response Address Data : ${httpResp.data}');
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
  Future<DataState> getEducationInfo() async {
    try {
      final httpResp = await remoteServices.educationInfo();

      if (httpResp.response.statusCode == HttpStatus.ok) {
        log('Response Education Data : ${httpResp.data}');
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
  Future<DataState> getEmergencyContact() async {
    try {
      final httpResp = await remoteServices.emCtcInfo();

      if (httpResp.response.statusCode == HttpStatus.ok) {
        log('Response Emergency Contact Data : ${httpResp.data}');
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
  Future<DataState> getFamilyInfo() async {
    try {
      final httpResp = await remoteServices.familyInfo();
      if (httpResp.response.statusCode == HttpStatus.ok) {
        log('Response Family Data : ${httpResp.data}');
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
  Future<DataState> getJobHistory() async {
    try {
      final httpResp = await remoteServices.jobInfo();
      if (httpResp.response.statusCode == HttpStatus.ok) {
        log('Response Job Data : ${httpResp.data}');
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
  Future<DataState> getPayrollInfo() async {
    try {
      final httpResp = await remoteServices.payrollInfo();
      if (httpResp.response.statusCode == HttpStatus.ok) {
        log('Response Payroll Data : ${httpResp.data}');
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
  Future<DataState> getPersonalInfo() {
    // TODO: implement getPersonalInfo
    throw UnimplementedError();
  }

  @override
  Future<DataState> getProfileInfo(String uid) async {
    try {
      final httpResp = await remoteServices.profileInfo();
      if (httpResp.response.statusCode == HttpStatus.ok) {
        log('Response Profile Data : ${httpResp.data}');
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
  Future<DataState> getActPeriod(String lokasi, String period) async {
    var params = PeriodLocationParams(period, lokasi);
    try {
      final httpResp = await remoteServices.profileScrnActPeriod(params);

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
  Future<DataState> getPersonalData() async {
    try {
      final httpResp = await remoteServices.profileInfo();
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
