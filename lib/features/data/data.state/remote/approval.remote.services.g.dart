// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approval.remote.services.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApprovalListParams _$ApprovalListParamsFromJson(Map<String, dynamic> json) =>
    ApprovalListParams(
      json['uid'] as String?,
      json['kodejenis'] as String?,
      json['onmobile'] as String?,
    );

Map<String, dynamic> _$ApprovalListParamsToJson(ApprovalListParams instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'kodejenis': instance.kodejenis,
      'onmobile': instance.onmobile,
    };

ApprvSubmitParams _$ApprvSubmitParamsFromJson(Map<String, dynamic> json) =>
    ApprvSubmitParams(
      json['uid'] as String?,
      json['id'] as String?,
      json['status'] as String?,
      json['keterangan'] as String?,
      json['spcparams'] as String?,
    );

Map<String, dynamic> _$ApprvSubmitParamsToJson(ApprvSubmitParams instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'id': instance.id,
      'status': instance.sts,
      'keterangan': instance.desc,
      'spcparams': instance.spc,
    };

ApprovalDataDetailParams _$ApprovalDataDetailParamsFromJson(
        Map<String, dynamic> json) =>
    ApprovalDataDetailParams(
      json['uid'] as String?,
      json['id'] as String?,
      json['notransaksi'] as String?,
      json['onmobile'] as String?,
    );

Map<String, dynamic> _$ApprovalDataDetailParamsToJson(
        ApprovalDataDetailParams instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'id': instance.id,
      'notransaksi': instance.txn,
      'onmobile': instance.onmobile,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _ApprovalApiServices implements ApprovalApiServices {
  _ApprovalApiServices(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://182.23.67.40:8083/officeapi/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<dynamic>> listApproval(
    ApprovalListParams? param,
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
              'http://182.23.67.40:8083/officeapi/API/apprv/user/list',
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
  Future<HttpResponse<dynamic>> approvalDataDetail(
    ApprovalDataDetailParams? param,
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
              'http://182.23.67.40:8083/officeapi/API/apprv/user/detail',
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
  Future<HttpResponse<dynamic>> approvalSubmitResponse(
    ApprvSubmitParams? param,
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
              'http://182.23.67.40:8083/officeapi/API/apprv/user/save',
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
