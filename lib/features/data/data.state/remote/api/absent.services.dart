import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:owl_hris/core/resources/cache.manager.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../lib.dart';
import '../network.utils.dart';

abstract class RemoteAbsentServices {
  Future<HttpResponse<dynamic>> listAbsent(ListAbsentParams? param);
  Future<HttpResponse<dynamic>> submitAbsent(SubmitAbsentBodyParams? param);
  Future<HttpResponse<dynamic>> userAssignLoc();
  Future<HttpResponse<dynamic>> userPINcheck(PINBodyParams? param);
  Future<HttpResponse<dynamic>> holidayList(HolidayBodyParams? param);
}

class RemoteAbsentServicesImpl extends RemoteAbsentServices with CacheManager {
  final Dio dio;
  RemoteAbsentServicesImpl({required this.dio});

  @override
  Future<HttpResponse<dynamic>> holidayList(HolidayBodyParams? param) async {
    var token = await accessToken();
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final headers = <String, dynamic>{r'Authorization': token};
    headers.removeWhere((k, v) => v == null);
    final data = <String, dynamic>{};
    data.addAll(param?.toMap() ?? <String, dynamic>{});
    final result = await dio.fetch(setStreamType<HttpResponse<dynamic>>(Options(
      method: 'POST',
      headers: headers,
      extra: extra,
    )
        .compose(
          dio.options,
          '${Endpoints.baseURL}/holiday/list',
          queryParameters: queryParameters,
          data: data,
        )
        .copyWith(
            baseUrl: combineBaseUrls(
          dio.options.baseUrl,
          baseUrl,
        ))));
    final value = result.data;
    final httpResponse = HttpResponse(value, result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<dynamic>> listAbsent(ListAbsentParams? param) async {
    var token = await accessToken();
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final headers = <String, dynamic>{r'Authorization': token};
    headers.removeWhere((k, v) => v == null);
    final data = <String, dynamic>{};
    data.addAll(param?.toJson() ?? <String, dynamic>{});
    final result = await dio.fetch(setStreamType<HttpResponse<dynamic>>(Options(
      method: 'POST',
      headers: headers,
      extra: extra,
    )
        .compose(
          dio.options,
          '${Endpoints.baseURL}/attendance/list',
          queryParameters: queryParameters,
          data: data,
        )
        .copyWith(
            baseUrl: combineBaseUrls(
          dio.options.baseUrl,
          baseUrl,
        ))));
    final value = result.data;
    final httpResponse = HttpResponse(value, result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<dynamic>> submitAbsent(
      SubmitAbsentBodyParams? param) async {
    var token = await accessToken();
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final headers = <String, dynamic>{r'Authorization': token};
    headers.removeWhere((k, v) => v == null);
    final data = <String, dynamic>{};
    data.addAll(param?.toMap() ?? <String, dynamic>{});
    final result = await dio.fetch(setStreamType<HttpResponse<dynamic>>(Options(
      method: 'POST',
      headers: headers,
      extra: extra,
    )
        .compose(
          dio.options,
          '${Endpoints.baseURL}/attendance/submit',
          queryParameters: queryParameters,
          data: data,
        )
        .copyWith(
            baseUrl: combineBaseUrls(
          dio.options.baseUrl,
          baseUrl,
        ))));
    final value = result.data;
    final httpResponse = HttpResponse(value, result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<dynamic>> userAssignLoc() async {
    var token = await accessToken();
    UserAssignLocBodyParams? param;
    var id = await userUID();
    param = UserAssignLocBodyParams(
      id,
      DateFormat('yyyy-MM-dd').format(DateTime.now()),
    );
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final headers = <String, dynamic>{r'Authorization': token};
    headers.removeWhere((k, v) => v == null);
    final data = <String, dynamic>{};
    data.addAll(param.toMap());
    final result = await dio.fetch(setStreamType<HttpResponse<dynamic>>(Options(
      method: 'POST',
      headers: headers,
      extra: extra,
    )
        .compose(
          dio.options,
          '${Endpoints.baseURL}/travel/active',
          queryParameters: queryParameters,
          data: data,
        )
        .copyWith(
            baseUrl: combineBaseUrls(
          dio.options.baseUrl,
          baseUrl,
        ))));
    final value = result.data;
    final httpResponse = HttpResponse(value, result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<dynamic>> userPINcheck(PINBodyParams? param) async {
    var token = await accessToken();
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final headers = <String, dynamic>{r'Authorization': token};
    headers.removeWhere((k, v) => v == null);
    final data = <String, dynamic>{};
    data.addAll(param?.toMap() ?? <String, dynamic>{});
    final result = await dio.fetch(setStreamType<HttpResponse<dynamic>>(Options(
      method: 'POST',
      headers: headers,
      extra: extra,
    )
        .compose(
          dio.options,
          '${Endpoints.urlUSER}/pin/check',
          queryParameters: queryParameters,
          data: data,
        )
        .copyWith(
            baseUrl: combineBaseUrls(
          dio.options.baseUrl,
          baseUrl,
        ))));
    final value = result.data;
    final httpResponse = HttpResponse(value, result);
    return httpResponse;
  }
}
