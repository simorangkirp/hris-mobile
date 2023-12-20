import 'package:dio/dio.dart';
// import 'package:json_annotation/json_annotation.dart';
import 'package:owl_hris/core/resources/cache.manager.dart';
import 'package:owl_hris/features/data/data.state/remote/network.utils.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../lib.dart';

abstract class RemoteProfileServices {
  Future<HttpResponse<dynamic>> profileInfo();
  Future<HttpResponse<dynamic>> addressInfo();
  Future<HttpResponse<dynamic>> educationInfo();
  Future<HttpResponse<dynamic>> familyInfo();
  Future<HttpResponse<dynamic>> jobInfo();
  Future<HttpResponse<dynamic>> emCtcInfo();
  Future<HttpResponse<dynamic>> payrollInfo();
  Future<HttpResponse<dynamic>> listAbsentProfileScreen(UIDPeriodParams param);
  Future<HttpResponse<dynamic>> profileScrnActPeriod(
      PeriodLocationParams param);
}

class RemoteProfileServicesImpl extends RemoteProfileServices
    with CacheManager {
  final Dio dio;
  RemoteProfileServicesImpl({required this.dio});

  @override
  Future<HttpResponse<dynamic>> addressInfo() async {
    var token = await accessToken();
    var uid = await userUID();
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{r'Authorization': token};
    headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? data = null;
    final result = await dio.fetch(setStreamType<HttpResponse<dynamic>>(Options(
      method: 'POST',
      headers: headers,
      extra: extra,
    )
        .compose(
          dio.options,
          '${Endpoints.urlUSER}/address/$uid',
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
  Future<HttpResponse<dynamic>> educationInfo() async {
    var token = await accessToken();
    var uid = await userUID();
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{r'Authorization': token};
    headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? data = null;
    final result = await dio.fetch(setStreamType<HttpResponse<dynamic>>(Options(
      method: 'POST',
      headers: headers,
      extra: extra,
    )
        .compose(
          dio.options,
          '${Endpoints.urlUSER}/edu/$uid',
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
  Future<HttpResponse<dynamic>> emCtcInfo() async {
    var token = await accessToken();
    var uid = await userUID();
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{r'Authorization': token};
    headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? data = null;
    final result = await dio.fetch(setStreamType<HttpResponse<dynamic>>(Options(
      method: 'POST',
      headers: headers,
      extra: extra,
    )
        .compose(
          dio.options,
          '${Endpoints.urlUSER}/emcontact/$uid',
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
  Future<HttpResponse<dynamic>> familyInfo() async {
    var token = await accessToken();
    var uid = await userUID();
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{r'Authorization': token};
    headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? data = null;
    final result = await dio.fetch(setStreamType<HttpResponse<dynamic>>(Options(
      method: 'POST',
      headers: headers,
      extra: extra,
    )
        .compose(
          dio.options,
          '${Endpoints.urlUSER}/family/$uid',
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
  Future<HttpResponse<dynamic>> jobInfo() async {
    var token = await accessToken();
    var uid = await userUID();
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{r'Authorization': token};
    headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? data = null;
    final result = await dio.fetch(setStreamType<HttpResponse<dynamic>>(Options(
      method: 'POST',
      headers: headers,
      extra: extra,
    )
        .compose(
          dio.options,
          '${Endpoints.urlUSER}/job/$uid',
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
  Future<HttpResponse<dynamic>> payrollInfo() async {
    var token = await accessToken();
    var uid = await userUID();
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{r'Authorization': token};
    headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? data = null;
    final result = await dio.fetch(setStreamType<HttpResponse<dynamic>>(Options(
      method: 'POST',
      headers: headers,
      extra: extra,
    )
        .compose(
          dio.options,
          '${Endpoints.urlUSER}/infopayroll/$uid',
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
  Future<HttpResponse<dynamic>> profileInfo() async {
    var token = await accessToken();
    var uid = await userUID();
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{r'Authorization': token};
    headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? data = null;
    final result = await dio.fetch(setStreamType<HttpResponse<dynamic>>(Options(
      method: 'POST',
      headers: headers,
      extra: extra,
    )
        .compose(
          dio.options,
          '${Endpoints.urlUSER}/profile/$uid',
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
  Future<HttpResponse<dynamic>> profileScrnActPeriod(
      PeriodLocationParams param) async {
    var token = await accessToken();
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final headers = <String, dynamic>{r'Authorization': token};
    headers.removeWhere((k, v) => v == null);
    final data = <String, dynamic>{};
    data.addAll(param.toJson());
    final result = await dio.fetch(setStreamType<HttpResponse<dynamic>>(Options(
      method: 'POST',
      headers: headers,
      extra: extra,
    )
        .compose(
          dio.options,
          '${Endpoints.urlSDM}/periodpayroll/active',
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
  Future<HttpResponse<dynamic>> listAbsentProfileScreen(
      UIDPeriodParams param) async {
    var token = await accessToken();
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final headers = <String, dynamic>{r'Authorization': token};
    headers.removeWhere((k, v) => v == null);
    final data = <String, dynamic>{};
    data.addAll(param.toJson());
    final result = await dio.fetch(setStreamType<HttpResponse<dynamic>>(Options(
      method: 'POST',
      headers: headers,
      extra: extra,
    )
        .compose(
          dio.options,
          '${Endpoints.urlSDM}/attendance/list',
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
