import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../../../../../core/constants/constants.dart';

part 'settings.remote.services.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class SettingAPIServices {
  factory SettingAPIServices(Dio dio, {String baseUrl}) = _SettingAPIServices;

  @POST('${baseUrl}auth/send-otp')
  Future<HttpResponse<dynamic>> reqOTP(
      @Body() ReqOTPParams? param, @Header("Authorization") String authHeader);

  @POST('${baseUrl}auth/change-password')
  Future<HttpResponse<dynamic>> changePwd(
      @Body() ChgPwdParams? param, @Header("Authorization") String authHeader);
}

@JsonSerializable()
class ReqOTPParams {
  @JsonKey(name: 'uid')
  String? uid;
  @JsonKey(name: 'password')
  String? pass;
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'onmobile')
  String? onmobile;

  ReqOTPParams(this.uid, this.pass, this.type, this.onmobile);
  factory ReqOTPParams.fromJson(Map<String, dynamic> json) =>
      _$ReqOTPParamsFromJson(json);
  Map<String, dynamic> toJson() => _$ReqOTPParamsToJson(this);
}

@JsonSerializable()
class ChgPwdParams {
  @JsonKey(name: 'uid')
  String? uid;
  @JsonKey(name: 'passwordlama')
  String? oldP;
  @JsonKey(name: 'passwordbaru')
  String? newP;
  @JsonKey(name: 'otp')
  String? otp;
  @JsonKey(name: 'onmobile')
  String? onmobile;

  ChgPwdParams(this.uid, this.oldP, this.newP, this.otp, this.onmobile);
  factory ChgPwdParams.fromJson(Map<String, dynamic> json) =>
      _$ChgPwdParamsFromJson(json);
  Map<String, dynamic> toJson() => _$ChgPwdParamsToJson(this);
}
