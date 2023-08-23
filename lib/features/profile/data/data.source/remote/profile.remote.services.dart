import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/constants/constants.dart';

part 'profile.remote.services.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class ProfileAPIServices {
  factory ProfileAPIServices(Dio dio, {String baseUrl}) = _ProfileAPIServices;

  @POST('${baseUrl}API/user/profile/{uid}')
  Future<HttpResponse<dynamic>> profileInfo(
      @Path("uid") String uid, @Header("Authorization") String authHeader);

  @POST('${baseUrl}API/SDM/attendance/list')
  Future<HttpResponse<dynamic>> listAbsentProfileScreen(@Body() ProfileAbsentParams? param,
      @Header("Authorization") String authHeader);
}

@JsonSerializable()
class ProfileAbsentParams {
  @JsonKey(name: 'uid')
  String? uid;
  @JsonKey(name: 'periode')
  String? periode;
  @JsonKey(name: 'onmobile')
  String? onmobile;

  ProfileAbsentParams(this.uid, this.periode, this.onmobile);
  factory ProfileAbsentParams.fromJson(Map<String, dynamic> json) =>
      _$ProfileAbsentParamsFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileAbsentParamsToJson(this);
}
