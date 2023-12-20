import 'package:dio/dio.dart';

RequestOptions setStreamType<T>(RequestOptions requestOptions) {
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

String combineBaseUrls(
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
