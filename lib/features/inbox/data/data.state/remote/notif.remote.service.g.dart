// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notif.remote.service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotifListParams _$NotifListParamsFromJson(Map<String, dynamic> json) =>
    NotifListParams(
      json['uid'] as String?,
      json['max'] as String?,
      json['onmobile'] as String?,
    );

Map<String, dynamic> _$NotifListParamsToJson(NotifListParams instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'max': instance.max,
      'onmobile': instance.onmobile,
    };

NotifApproval _$NotifApprovalFromJson(Map<String, dynamic> json) =>
    NotifApproval(
      json['uid'] as String?,
      json['onmobile'] as String?,
    );

Map<String, dynamic> _$NotifApprovalToJson(NotifApproval instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'onmobile': instance.onmobile,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _NotifAPIServices implements NotifAPIServices {
  _NotifAPIServices(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://182.23.67.40:8083/officeapi/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<dynamic>> notifScreenListData(
    NotifListParams? param,
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
              'http://182.23.67.40:8083/officeapi/API/notifapp/list',
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
  Future<HttpResponse<dynamic>> notifScreenApprovalData(
    NotifApproval? param,
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
              'http://182.23.67.40:8083/officeapi/API/apprv/user/listnotif',
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
