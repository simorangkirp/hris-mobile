// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paid.leave.remote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatDetailBody _$CatDetailBodyFromJson(Map<String, dynamic> json) =>
    CatDetailBody(
      json['idkelompok'] as String?,
    );

Map<String, dynamic> _$CatDetailBodyToJson(CatDetailBody instance) =>
    <String, dynamic>{
      'idkelompok': instance.idkelompok,
    };

PaidLeaveDetailBody _$PaidLeaveDetailBodyFromJson(Map<String, dynamic> json) =>
    PaidLeaveDetailBody(
      json['uid'] as String?,
      json['notransaksi'] as String?,
      json['onmobile'] as String?,
    );

Map<String, dynamic> _$PaidLeaveDetailBodyToJson(
        PaidLeaveDetailBody instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'notransaksi': instance.notransaksi,
      'onmobile': instance.onmobile,
    };

PaidLeaveSubmitBody _$PaidLeaveSubmitBodyFromJson(Map<String, dynamic> json) =>
    PaidLeaveSubmitBody(
      json['uid'] as String?,
      json['tglpengajuan'] as String?,
      json['keterangan'] as String?,
      json['tgldari'] as String?,
      json['tglsampai'] as String?,
      json['idjenis'] as String?,
      json['jumlahhari'] as String?,
      json['tglmulaikerja'] as String?,
      json['fileupload'] as String?,
      json['typefile'] as String?,
      json['onmobile'] as String?,
    );

Map<String, dynamic> _$PaidLeaveSubmitBodyToJson(
        PaidLeaveSubmitBody instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'tglpengajuan': instance.tglpengajuan,
      'keterangan': instance.keterangan,
      'tgldari': instance.tgldari,
      'tglsampai': instance.tglsampai,
      'idjenis': instance.idjenis,
      'jumlahhari': instance.jumlahhari,
      'tglmulaikerja': instance.tglmulaikerja,
      'fileupload': instance.fileupload,
      'typefile': instance.typefile,
      'onmobile': instance.onmobile,
    };

PaidLeaveListBody _$PaidLeaveListBodyFromJson(Map<String, dynamic> json) =>
    PaidLeaveListBody(
      json['uid'] as String?,
      json['periode'] as String?,
      json['onmobile'] as String?,
    );

Map<String, dynamic> _$PaidLeaveListBodyToJson(PaidLeaveListBody instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'periode': instance.periode,
      'onmobile': instance.onmobile,
    };

PlafondBodyParam _$PlafondBodyParamFromJson(Map<String, dynamic> json) =>
    PlafondBodyParam(
      json['uid'] as String?,
      json['onmobile'] as String?,
    );

Map<String, dynamic> _$PlafondBodyParamToJson(PlafondBodyParam instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'onmobile': instance.onmobile,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _PaidLeaveAPIService implements PaidLeaveAPIService {
  _PaidLeaveAPIService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://182.23.67.40:8083/officeapi/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<dynamic>> category(String authHeader) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': authHeader};
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result =
        await _dio.fetch(_setStreamType<HttpResponse<dynamic>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'http://182.23.67.40:8083/officeapi/API/SDM/leave/category',
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
  Future<HttpResponse<dynamic>> categoryDetail(
    CatDetailBody? param,
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
              'http://182.23.67.40:8083/officeapi/API/SDM/leave/categorydetail',
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
  Future<HttpResponse<dynamic>> paidleaveDetail(
    PaidLeaveDetailBody? param,
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
              'http://182.23.67.40:8083/officeapi/API/SDM/leave/detail',
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
  Future<HttpResponse<dynamic>> paidleaveplafond(
    PlafondBodyParam? param,
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
              'http://182.23.67.40:8083/officeapi/API/SDM/leave/plafond',
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
  Future<HttpResponse<dynamic>> paidleavelist(
    PaidLeaveListBody? param,
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
              'http://182.23.67.40:8083/officeapi/API/SDM/leave/list',
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
  Future<HttpResponse<dynamic>> paidleavesubmit(
    PaidLeaveSubmitBody? param,
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
              'http://182.23.67.40:8083/officeapi/API/SDM/leave/submit',
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
