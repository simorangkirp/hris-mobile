import 'package:dio/dio.dart';
import 'package:owl_hris/core/resources/cache.manager.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../lib.dart';
import '../network.utils.dart';

// part 'home.service.g.dart';

// @RestApi(baseUrl: baseUrl)
// abstract class HomeApiServices {
//   factory HomeApiServices(Dio dio, {String baseUrl}) = _HomeApiServices;

//   @POST('${baseUrl}API/user/profile/{uid}')
//   Future<HttpResponse<dynamic>> profileInfo(
//       @Path("uid") String uid, @Header("Authorization") String authHeader);

//   @POST('${baseUrl}API/apprv/user/listnotif')
//   Future<HttpResponse<dynamic>> dashboardScreenApprovalData(
//       @Body() DashboardApproval? param,
//       @Header("Authorization") String authHeader);
// }

// @JsonSerializable()
// class DashboardApproval {
//   @JsonKey(name: 'uid')
//   String? uid;
//   @JsonKey(name: 'onmobile')
//   String? onmobile;

//   DashboardApproval(this.uid, this.onmobile);
//   factory DashboardApproval.fromJson(Map<String, dynamic> json) =>
//       _$DashboardApprovalFromJson(json);
//   Map<String, dynamic> toJson() => _$DashboardApprovalToJson(this);
// }

abstract class RemoteDashboardServices {
  Future<HttpResponse<dynamic>> profileInfo();
  Future<HttpResponse<dynamic>> dashboardScreenApprovalData();
}

class RemoteDashboardServicesImpl extends RemoteDashboardServices
    with CacheManager {
  final Dio dio;
  RemoteDashboardServicesImpl({required this.dio});

  @override
  Future<HttpResponse<dynamic>> dashboardScreenApprovalData() async {
    RemoteDashboardParams? params;
    var uid = await userUID();
    var token = await accessToken();
    params = RemoteDashboardParams(uid);
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
  Future<HttpResponse<dynamic>> profileInfo() async {
    var uid = await userUID();
    var token = await accessToken();
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
}
