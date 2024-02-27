import 'package:owl_hris/core/resources/cache.manager.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../../../../../lib.dart';
import '../network.utils.dart';

abstract class RemoteApprovalServices {
  Future<HttpResponse<dynamic>> listApproval(jenis);
  Future<HttpResponse<dynamic>> approvalDataDetail(
      ApprovalDataDetailParams? param);
  Future<HttpResponse<dynamic>> approvalSubmitResponse(
      ApprvSubmitParams? param);
}

class RemoteApprovalServicesImpl extends RemoteApprovalServices
    with CacheManager {
  final Dio dio;
  RemoteApprovalServicesImpl({required this.dio});

  @override
  Future<HttpResponse<dynamic>> approvalDataDetail(
      ApprovalDataDetailParams? param) async {
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
          '${Endpoints.urlAPPROVAL}/user/detail',
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
  Future<HttpResponse<dynamic>> approvalSubmitResponse(
      ApprvSubmitParams? param) async {
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
          '${Endpoints.urlAPPROVAL}/user/save',
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
  Future<HttpResponse<dynamic>> listApproval(jenis) async {
    var token = await accessToken();
    ApprovalListParams? param;
    var id = await userUID();
    param = ApprovalListParams(id, jenis, '1');
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
          '${Endpoints.urlAPPROVAL}/user/list',
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
