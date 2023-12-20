import 'package:owl_hris/core/resources/cache.manager.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../../../../../lib.dart';
import '../network.utils.dart';

abstract class RemoteSettingServices {
  Future<HttpResponse<dynamic>> reqOTP(String pwd);
  Future<HttpResponse<dynamic>> changePwd(String op, String np, String otp);
}

class RemoteSettingServicesImpl extends RemoteSettingServices
    with CacheManager {
  final Dio dio;
  RemoteSettingServicesImpl({required this.dio});

  @override
  Future<HttpResponse<dynamic>> changePwd(String op, np, otp) async {
    var token = await accessToken();
    ChgPwdParams? param;
    var id = await userUID();
    param = ChgPwdParams(id, op, np, otp);
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
          '${Endpoints.urlAUTH}auth/change-password',
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
  Future<HttpResponse<dynamic>> reqOTP(String pwd) async {
    var token = await accessToken();
    ReqOTPParams? param;
    var id = await userUID();
    param = ReqOTPParams(
      id,
      pwd,
    );
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
          '${Endpoints.urlAUTH}/send-otp',
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
