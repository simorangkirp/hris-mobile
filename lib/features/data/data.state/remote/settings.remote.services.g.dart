// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.remote.services.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReqOTPParams _$ReqOTPParamsFromJson(Map<String, dynamic> json) => ReqOTPParams(
      json['uid'] as String?,
      json['password'] as String?,
      json['type'] as String?,
      json['onmobile'] as String?,
    );

Map<String, dynamic> _$ReqOTPParamsToJson(ReqOTPParams instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'password': instance.pass,
      'type': instance.type,
      'onmobile': instance.onmobile,
    };

ChgPwdParams _$ChgPwdParamsFromJson(Map<String, dynamic> json) => ChgPwdParams(
      json['uid'] as String?,
      json['passwordlama'] as String?,
      json['passwordbaru'] as String?,
      json['otp'] as String?,
      json['onmobile'] as String?,
    );

Map<String, dynamic> _$ChgPwdParamsToJson(ChgPwdParams instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'passwordlama': instance.oldP,
      'passwordbaru': instance.newP,
      'otp': instance.otp,
      'onmobile': instance.onmobile,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _SettingAPIServices implements SettingAPIServices {
  _SettingAPIServices(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://182.23.67.40:8083/officeapi/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<dynamic>> reqOTP(
    ReqOTPParams? param,
    String authHeader,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'Authorization': authHeader};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(param?.toJson() ?? <String, dynamic>{});
    final _result =
        await _dio.fetch(_setStreamType<HttpResponse<dynamic>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'http://182.23.67.40:8083/officeapi/auth/send-otp',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = _result.data;
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<dynamic>> changePwd(
    ChgPwdParams? param,
    String authHeader,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'Authorization': authHeader};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(param?.toJson() ?? <String, dynamic>{});
    final _result =
        await _dio.fetch(_setStreamType<HttpResponse<dynamic>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'http://182.23.67.40:8083/officeapi/auth/change-password',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = _result.data;
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
