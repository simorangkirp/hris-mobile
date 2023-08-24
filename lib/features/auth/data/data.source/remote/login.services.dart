import 'package:dio/dio.dart';
// import 'package:owl_hris/features/auth/data/models/login.model.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/constants/constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login.services.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class LoginAPIServices {
  factory LoginAPIServices(Dio dio, {String baseUrl}) = _LoginAPIServices;

  @POST('${baseUrl}auth/login')
  Future<HttpResponse<dynamic>> loginUser(@Body() LoginParam? param);

  @POST('${baseUrl}API/user/profile/{uid}')
  Future<HttpResponse<dynamic>> profileInfo(
      @Path("uid") String uid, @Header("Authorization") String authHeader);

  @POST('${baseUrl}API/SDM/periodpayroll/active')
  Future<HttpResponse<dynamic>> profileScrnActPeriod(
      @Body() AuthScrnActPeriodParams? param,
      @Header("Authorization") String authHeader);
}

@JsonSerializable()
class LoginParam {
  @JsonKey(name: 'namauser')
  String? userNm;
  @JsonKey(name: 'password')
  String? pwd;
  @JsonKey(name: 'onmobile')
  String? onmobile;

  LoginParam(this.userNm, this.pwd, this.onmobile);
  factory LoginParam.fromJson(Map<String, dynamic> json) =>
      _$LoginParamFromJson(json);
  Map<String, dynamic> toJson() => _$LoginParamToJson(this);
}

@JsonSerializable()
class AuthScrnActPeriodParams {
  @JsonKey(name: 'lokasitugas')
  String? loc;
  @JsonKey(name: 'tanggal')
  String? dt;

  AuthScrnActPeriodParams(this.loc, this.dt);
  factory AuthScrnActPeriodParams.fromJson(Map<String, dynamic> json) =>
      _$AuthScrnActPeriodParamsFromJson(json);
  Map<String, dynamic> toJson() => _$AuthScrnActPeriodParamsToJson(this);
}

//! file .g.dart
//  replace
//  final value = LoginModel.fromJson(_result.data!);
//  to 
//  final value = LoginModel.fromJson(_result.data!['data']);
