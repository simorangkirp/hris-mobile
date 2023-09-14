import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../../../../../core/constants/constants.dart';

part 'notif.remote.service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class NotifAPIServices {
  factory NotifAPIServices(Dio dio, {String baseUrl}) = _NotifAPIServices;

  @POST('${baseUrl}API/notifapp/list')
  Future<HttpResponse<dynamic>> notifScreenListData(
      @Body() NotifListParams? param,
      @Header("Authorization") String authHeader);

  @POST('${baseUrl}API/apprv/user/listnotif')
  Future<HttpResponse<dynamic>> notifScreenApprovalData(
      @Body() NotifApproval? param, @Header("Authorization") String authHeader);
}

@JsonSerializable()
class NotifListParams {
  @JsonKey(name: 'uid')
  String? uid;
  @JsonKey(name: 'max')
  String? max;
  @JsonKey(name: 'onmobile')
  String? onmobile;

  NotifListParams(this.uid, this.max, this.onmobile);
  factory NotifListParams.fromJson(Map<String, dynamic> json) =>
      _$NotifListParamsFromJson(json);
  Map<String, dynamic> toJson() => _$NotifListParamsToJson(this);
}

@JsonSerializable()
class NotifApproval {
  @JsonKey(name: 'uid')
  String? uid;
  @JsonKey(name: 'onmobile')
  String? onmobile;

  NotifApproval(this.uid, this.onmobile);
  factory NotifApproval.fromJson(Map<String, dynamic> json) =>
      _$NotifApprovalFromJson(json);
  Map<String, dynamic> toJson() => _$NotifApprovalToJson(this);
}
