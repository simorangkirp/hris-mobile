import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/constants/constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'paid.leave.remote.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class PaidLeaveAPIService {
  factory PaidLeaveAPIService(Dio dio, {String baseUrl}) = _PaidLeaveAPIService;

  @POST('${baseUrl}API/SDM/leave/category')
  Future<HttpResponse<dynamic>> category(
      @Header("Authorization") String authHeader);

  @POST('${baseUrl}API/SDM/leave/categorydetail')
  Future<HttpResponse<dynamic>> categoryDetail(
      @Body() CatDetailBody? param, @Header("Authorization") String authHeader);
  
  @POST('${baseUrl}API/SDM/leave/detail')
  Future<HttpResponse<dynamic>> paidleaveDetail(
      @Body() PaidLeaveDetailBody? param,
      @Header("Authorization") String authHeader);

  @POST('${baseUrl}API/SDM/leave/plafond')
  Future<HttpResponse<dynamic>> paidleaveplafond(
      @Body() PlafondBodyParam? param,
      @Header("Authorization") String authHeader);

  @POST('${baseUrl}API/SDM/leave/list')
  Future<HttpResponse<dynamic>> paidleavelist(@Body() PaidLeaveListBody? param,
      @Header("Authorization") String authHeader);

  @POST('${baseUrl}API/SDM/leave/submit')
  Future<HttpResponse<dynamic>> paidleavesubmit(
      @Body() PaidLeaveSubmitBody? param,
      @Header("Authorization") String authHeader);
}

@JsonSerializable()
class CatDetailBody {
  @JsonKey(name: 'idkelompok')
  String? idkelompok;

  CatDetailBody(
    this.idkelompok,
  );
  factory CatDetailBody.fromJson(Map<String, dynamic> json) =>
      _$CatDetailBodyFromJson(json);
  Map<String, dynamic> toJson() => _$CatDetailBodyToJson(this);
}

@JsonSerializable()
class PaidLeaveDetailBody {
  @JsonKey(name: 'uid')
  String? uid;
  @JsonKey(name: 'notransaksi')
  String? notransaksi;
  @JsonKey(name: 'onmobile')
  String? onmobile;

  PaidLeaveDetailBody(
    this.uid,
    this.notransaksi,
    this.onmobile,
  );
  factory PaidLeaveDetailBody.fromJson(Map<String, dynamic> json) =>
      _$PaidLeaveDetailBodyFromJson(json);
  Map<String, dynamic> toJson() => _$PaidLeaveDetailBodyToJson(this);
}

@JsonSerializable()
class PaidLeaveSubmitBody {
  @JsonKey(name: 'uid')
  String? uid;
  @JsonKey(name: 'tglpengajuan')
  String? tglpengajuan;
  @JsonKey(name: 'keterangan')
  String? keterangan;
  @JsonKey(name: 'tgldari')
  String? tgldari;
  @JsonKey(name: 'tglsampai')
  String? tglsampai;
  @JsonKey(name: 'idjenis')
  String? idjenis;
  @JsonKey(name: 'jumlahhari')
  String? jumlahhari;
  @JsonKey(name: 'tglmulaikerja')
  String? tglmulaikerja;
  @JsonKey(name: 'fileupload')
  String? fileupload;
  @JsonKey(name: 'typefile')
  String? typefile;
  @JsonKey(name: 'onmobile')
  String? onmobile;

  PaidLeaveSubmitBody(
    this.uid,
    this.tglpengajuan,
    this.keterangan,
    this.tgldari,
    this.tglsampai,
    this.idjenis,
    this.jumlahhari,
    this.tglmulaikerja,
    this.fileupload,
    this.typefile,
    this.onmobile,
  );
  factory PaidLeaveSubmitBody.fromJson(Map<String, dynamic> json) =>
      _$PaidLeaveSubmitBodyFromJson(json);
  Map<String, dynamic> toJson() => _$PaidLeaveSubmitBodyToJson(this);
}

@JsonSerializable()
class PaidLeaveListBody {
  @JsonKey(name: 'uid')
  String? uid;
  @JsonKey(name: 'periode')
  String? periode;
  @JsonKey(name: 'onmobile')
  String? onmobile;

  PaidLeaveListBody(
    this.uid,
    this.periode,
    this.onmobile,
  );
  factory PaidLeaveListBody.fromJson(Map<String, dynamic> json) =>
      _$PaidLeaveListBodyFromJson(json);
  Map<String, dynamic> toJson() => _$PaidLeaveListBodyToJson(this);
}

@JsonSerializable()
class PlafondBodyParam {
  @JsonKey(name: 'uid')
  String? uid;
  @JsonKey(name: 'onmobile')
  String? onmobile;

  PlafondBodyParam(
    this.uid,
    this.onmobile,
  );
  factory PlafondBodyParam.fromJson(Map<String, dynamic> json) =>
      _$PlafondBodyParamFromJson(json);
  Map<String, dynamic> toJson() => _$PlafondBodyParamToJson(this);
}
