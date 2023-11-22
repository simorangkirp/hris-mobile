import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/constants/constants.dart';

part 'home.service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class HomeApiServices {
  factory HomeApiServices(Dio dio, {String baseUrl}) = _HomeApiServices;

  @POST('${baseUrl}API/user/profile/{uid}')
  Future<HttpResponse<dynamic>> profileInfo(
      @Path("uid") String uid, @Header("Authorization") String authHeader);

  @POST('${baseUrl}API/apprv/user/listnotif')
  Future<HttpResponse<dynamic>> dashboardScreenApprovalData(
      @Body() DashboardApproval? param, @Header("Authorization") String authHeader);
}

@JsonSerializable()
class DashboardApproval {
  @JsonKey(name: 'uid')
  String? uid;
  @JsonKey(name: 'onmobile')
  String? onmobile;

  DashboardApproval(this.uid, this.onmobile);
  factory DashboardApproval.fromJson(Map<String, dynamic> json) =>
      _$DashboardApprovalFromJson(json);
  Map<String, dynamic> toJson() => _$DashboardApprovalToJson(this);
}
