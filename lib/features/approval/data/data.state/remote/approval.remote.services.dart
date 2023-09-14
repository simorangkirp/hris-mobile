import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../../../../../core/constants/constants.dart';

part 'approval.remote.services.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class ApprovalApiServices {
  factory ApprovalApiServices(Dio dio, {String baseUrl}) = _ApprovalApiServices;

  @POST('${baseUrl}API/apprv/user/list')
  Future<HttpResponse<dynamic>> listApproval(@Body() ApprovalListParams? param,
      @Header("Authorization") String authHeader);

  @POST('${baseUrl}API/apprv/user/detail')
  Future<HttpResponse<dynamic>> approvalDataDetail(
      @Body() ApprovalDataDetailParams? param,
      @Header("Authorization") String authHeader);

  @POST('${baseUrl}API/apprv/user/save')
  Future<HttpResponse<dynamic>> approvalSubmitResponse(
      @Body() ApprvSubmitParams? param,
      @Header("Authorization") String authHeader);
}

@JsonSerializable()
class ApprovalListParams {
  @JsonKey(name: 'uid')
  String? uid;
  @JsonKey(name: 'kodejenis')
  String? kodejenis;
  @JsonKey(name: 'onmobile')
  String? onmobile;

  ApprovalListParams(this.uid, this.kodejenis, this.onmobile);
  factory ApprovalListParams.fromJson(Map<String, dynamic> json) =>
      _$ApprovalListParamsFromJson(json);
  Map<String, dynamic> toJson() => _$ApprovalListParamsToJson(this);
}

@JsonSerializable()
class ApprvSubmitParams {
  @JsonKey(name: 'uid')
  String? uid;
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'status')
  String? sts;
  @JsonKey(name: 'keterangan')
  String? desc;
  @JsonKey(name: 'spcparams')
  String? spc;

  ApprvSubmitParams(
    this.uid,
    this.id,
    this.sts,
    this.desc,
    this.spc,
  );
  factory ApprvSubmitParams.fromJson(Map<String, dynamic> json) =>
      _$ApprvSubmitParamsFromJson(json);
  Map<String, dynamic> toJson() => _$ApprvSubmitParamsToJson(this);
}

@JsonSerializable()
class ApprovalDataDetailParams {
  @JsonKey(name: 'uid')
  String? uid;
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'notransaksi')
  String? txn;
  @JsonKey(name: 'onmobile')
  String? onmobile;

  ApprovalDataDetailParams(this.uid, this.id, this.txn, this.onmobile);
  factory ApprovalDataDetailParams.fromJson(Map<String, dynamic> json) =>
      _$ApprovalDataDetailParamsFromJson(json);
  Map<String, dynamic> toJson() => _$ApprovalDataDetailParamsToJson(this);
}
