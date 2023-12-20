import 'package:owl_hris/core/resources/cache.manager.dart';
import 'package:owl_hris/features/data/data.state/remote/network.utils.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../../../../../lib.dart';

abstract class RemoteNotifServices {
  Future<HttpResponse<dynamic>> notifScreenListData();
  Future<HttpResponse<dynamic>> notifScreenApprovalData();
}

class RemoteNotifServicesImpl extends RemoteNotifServices with CacheManager {
  final Dio dio;
  RemoteNotifServicesImpl({required this.dio});

  @override
  Future<HttpResponse<dynamic>> notifScreenApprovalData() async {
    var token = await accessToken();
    UIDMobileParams? params;
    var uid = await userUID();
    params = UIDMobileParams(uid);
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final headers = <String, dynamic>{r'Authorization': token};
    headers.removeWhere((k, v) => v == null);
    final data = <String, dynamic>{};
    data.addAll(params.notifListParams());
    final result = await dio.fetch(setStreamType<HttpResponse<dynamic>>(Options(
      method: 'POST',
      headers: headers,
      extra: extra,
    )
        .compose(
          dio.options,
          '${Endpoints.urlAPPROVAL}/user/listnotif',
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
  Future<HttpResponse<dynamic>> notifScreenListData() async {
    var token = await accessToken();
    UIDMobileParams? params;
    var uid = await userUID();
    params = UIDMobileParams(uid);
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final headers = <String, dynamic>{r'Authorization': token};
    headers.removeWhere((k, v) => v == null);
    final data = <String, dynamic>{};
    data.addAll(params.toJson());
    final result = await dio.fetch(setStreamType<HttpResponse<dynamic>>(Options(
      method: 'POST',
      headers: headers,
      extra: extra,
    )
        .compose(
          dio.options,
          '${Endpoints.urlNOTIF}/list',
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
