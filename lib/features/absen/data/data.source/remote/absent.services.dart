import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/constants/constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'absent.services.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class AbsentAPIServices {
  factory AbsentAPIServices(Dio dio, {String baseUrl}) = _AbsentAPIServices;

  @POST('${baseUrl}API/SDM/attendance/list')
  Future<HttpResponse<dynamic>> listAbsent(@Body() ListAbsentParams? param,
      @Header("Authorization") String authHeader);
}

@JsonSerializable()
class ListAbsentParams {
  @JsonKey(name: 'uid')
  String? uid;
  @JsonKey(name: 'periode')
  String? periode;
  @JsonKey(name: 'onmobile')
  String? onmobile;

  ListAbsentParams(this.uid, this.periode, this.onmobile);
  factory ListAbsentParams.fromJson(Map<String, dynamic> json) =>
      _$ListAbsentParamsFromJson(json);
  Map<String, dynamic> toJson() => _$ListAbsentParamsToJson(this);
}
