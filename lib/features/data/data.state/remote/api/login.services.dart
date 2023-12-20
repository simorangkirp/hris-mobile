import 'package:dio/dio.dart';
import 'package:owl_hris/core/resources/cache.manager.dart';
import 'package:owl_hris/features/data/data.state/remote/endpoints.dart';
import 'package:owl_hris/features/data/data.state/remote/network.utils.dart';
// import 'package:owl_hris/features/auth/data/models/login.model.dart';
import 'package:retrofit/retrofit.dart';
// import '../../../../../core/constants/constants.dart';
import '../../../../../lib.dart';
// import 'package:json_annotation/json_annotation.dart';

// part 'login.services.g.dart';

// @RestApi(baseUrl: baseUrl)
// abstract class LoginAPIServices {
//   factory LoginAPIServices(Dio dio, {String baseUrl}) = _LoginAPIServices;

//   @POST('${baseUrl}auth/login')
//   Future<HttpResponse<dynamic>> loginUser(@Body() LoginParam? param);

//   @POST('${baseUrl}API/user/profile/{uid}')
//   Future<HttpResponse<dynamic>> profileInfo(
//       @Path("uid") String uid, @Header("Authorization") String authHeader);

//   @POST('${baseUrl}API/SDM/periodpayroll/active')
//   Future<HttpResponse<dynamic>> profileScrnActPeriod(
//       @Body() AuthScrnActPeriodParams? param,
//       @Header("Authorization") String authHeader);
// }

// @JsonSerializable()
// class LoginParam {
//   @JsonKey(name: 'namauser')
//   String? userNm;
//   @JsonKey(name: 'password')
//   String? pwd;
//   @JsonKey(name: 'version')
//   String? version;
//   @JsonKey(name: 'onmobile')
//   String? onmobile;

//   LoginParam(this.userNm, this.pwd, this.version, this.onmobile);
//   factory LoginParam.fromJson(Map<String, dynamic> json) =>
//       _$LoginParamFromJson(json);
//   Map<String, dynamic> toJson() => _$LoginParamToJson(this);
// }

// @JsonSerializable()
// class AuthScrnActPeriodParams {
//   @JsonKey(name: 'tanggal')
//   String? dt;
//   @JsonKey(name: 'lokasitugas')
//   String? loc;

//   AuthScrnActPeriodParams(this.dt, this.loc);
//   factory AuthScrnActPeriodParams.fromJson(Map<String, dynamic> json) =>
//       _$AuthScrnActPeriodParamsFromJson(json);
//   Map<String, dynamic> toJson() => _$AuthScrnActPeriodParamsToJson(this);
// }

//! file .g.dart
//  replace
//  final value = LoginModel.fromJson(_result.data!);
//  to
//  final value = LoginModel.fromJson(_result.data!['data']);

abstract class RemoteLoginScreenServices {
  Future<HttpResponse<dynamic>> login(RemoteLoginModel model);
  Future<HttpResponse<dynamic>> getProfileInfo(String? uid, String authHeader);
  Future<HttpResponse<dynamic>> getActPeriod(RemoteLoginActPeriodModel? param);
}

class RemoteLoginScreenServicesImpl extends RemoteLoginScreenServices
    with CacheManager {
  final Dio dio;
  RemoteLoginScreenServicesImpl({required this.dio});

  @override
  Future<HttpResponse> getProfileInfo(String? uid, String authHeader) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{r'Authorization': authHeader};
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
  Future<HttpResponse> getActPeriod(RemoteLoginActPeriodModel? param) async {
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
  Future<HttpResponse> login(RemoteLoginModel model) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final headers = <String, dynamic>{};
    final data = model.toLogin();
    final result = await dio.fetch(setStreamType<HttpResponse<dynamic>>(Options(
      method: 'POST',
      headers: headers,
      extra: extra,
    )
        .compose(
          dio.options,
          '${Endpoints.urlAUTH}/login',
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
