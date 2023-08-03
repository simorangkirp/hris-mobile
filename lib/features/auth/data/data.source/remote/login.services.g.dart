// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.services.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginParam _$LoginParamFromJson(Map<String, dynamic> json) => LoginParam(
      json['namauser'] as String?,
      json['password'] as String?,
      json['onmobile'] as String?,
    );

Map<String, dynamic> _$LoginParamToJson(LoginParam instance) =>
    <String, dynamic>{
      'namauser': instance.userNm,
      'password': instance.pwd,
      'onmobile': instance.onmobile,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _LoginAPIServices implements LoginAPIServices {
  _LoginAPIServices(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://182.23.67.40:8083/officeapi/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<LoginModel>> loginUser(LoginParam? param) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(param?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<LoginModel>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'http://182.23.67.40:8083/officeapi/auth/login',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = LoginModel.fromJson(_result.data!['data']);
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
