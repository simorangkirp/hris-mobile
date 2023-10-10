// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'absent.services.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListAbsentParams _$ListAbsentParamsFromJson(Map<String, dynamic> json) =>
    ListAbsentParams(
      json['uid'] as String?,
      json['periode'] as String?,
      json['onmobile'] as String?,
    );

Map<String, dynamic> _$ListAbsentParamsToJson(ListAbsentParams instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'periode': instance.periode,
      'onmobile': instance.onmobile,
    };

PINBody _$PINBodyFromJson(Map<String, dynamic> json) => PINBody(
      json['uid'] as String?,
      json['pin'] as String?,
    );

Map<String, dynamic> _$PINBodyToJson(PINBody instance) => <String, dynamic>{
      'uid': instance.uid,
      'pin': instance.pin,
    };

UserAssignLocBody _$UserAssignLocBodyFromJson(Map<String, dynamic> json) =>
    UserAssignLocBody(
      json['uid'] as String?,
      json['tanggal'] as String?,
    );

Map<String, dynamic> _$UserAssignLocBodyToJson(UserAssignLocBody instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'tanggal': instance.date,
    };

SubmitAbsentBody _$SubmitAbsentBodyFromJson(Map<String, dynamic> json) =>
    SubmitAbsentBody(
      json['uid'] as String?,
      json['tanggal'] as String?,
      json['periode'] as String?,
      json['absensi'] as String?,
      json['inoutmode'] as String?,
      json['jam'] as String?,
      json['coordinate'] as String?,
      json['photo'] as String?,
      json['keterangan'] as String?,
      json['source'] as String?,
      json['coorphoto'] as String?,
    );

Map<String, dynamic> _$SubmitAbsentBodyToJson(SubmitAbsentBody instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'tanggal': instance.date,
      'periode': instance.period,
      'absensi': instance.absent,
      'inoutmode': instance.inoutmode,
      'jam': instance.hr,
      'coordinate': instance.coordinate,
      'photo': instance.photo,
      'keterangan': instance.desc,
      'source': instance.source,
      'coorphoto': instance.coorphoto,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _AbsentAPIServices implements AbsentAPIServices {
  _AbsentAPIServices(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://182.23.67.40:8083/officeapi/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<dynamic>> listAbsent(
    ListAbsentParams? param,
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
              'http://182.23.67.40:8083/officeapi/API/SDM/attendance/list',
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
  Future<HttpResponse<dynamic>> submitAbsent(
    SubmitAbsentBody? param,
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
              'http://182.23.67.40:8083/officeapi/API/SDM/attendance/submit',
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
  Future<HttpResponse<dynamic>> userAssignLoc(
    UserAssignLocBody? param,
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
              'http://182.23.67.40:8083/officeapi/API/SDM/travel/active',
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
  Future<HttpResponse<dynamic>> userPINcheck(
    PINBody? param,
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
              'http://182.23.67.40:8083/officeapi/API/user/pin/check',
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
