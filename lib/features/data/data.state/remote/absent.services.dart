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

  @POST('${baseUrl}API/SDM/attendance/submit')
  Future<HttpResponse<dynamic>> submitAbsent(@Body() SubmitAbsentBody? param,
      @Header("Authorization") String authHeader);

  @POST('${baseUrl}API/SDM/travel/active')
  Future<HttpResponse<dynamic>> userAssignLoc(@Body() UserAssignLocBody? param,
      @Header("Authorization") String authHeader);

  @POST('${baseUrl}API/user/pin/check')
  Future<HttpResponse<dynamic>> userPINcheck(
      @Body() PINBody? param, @Header("Authorization") String authHeader);

  @POST('${baseUrl}API/SDM/holiday/list')
  Future<HttpResponse<dynamic>> holidayList(
      @Body() HolidayBody? param, @Header("Authorization") String authHeader);
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

@JsonSerializable()
class PINBody {
  @JsonKey(name: 'uid')
  String? uid;
  @JsonKey(name: 'pin')
  String? pin;

  PINBody(
    this.uid,
    this.pin,
  );
  factory PINBody.fromJson(Map<String, dynamic> json) =>
      _$PINBodyFromJson(json);
  Map<String, dynamic> toJson() => _$PINBodyToJson(this);
}

@JsonSerializable()
class HolidayBody {
  @JsonKey(name: 'kodeorg')
  String? kodeorg;
  @JsonKey(name: 'tahun')
  String? tahun;
  @JsonKey(name: 'tipekaryawan')
  String? tipekaryawan;

  HolidayBody(
    this.kodeorg,
    this.tahun,
    this.tipekaryawan,
  );
  factory HolidayBody.fromJson(Map<String, dynamic> json) =>
      _$HolidayBodyFromJson(json);
  Map<String, dynamic> toJson() => _$HolidayBodyToJson(this);
}

@JsonSerializable()
class UserAssignLocBody {
  @JsonKey(name: 'uid')
  String? uid;
  @JsonKey(name: 'tanggal')
  String? date;

  UserAssignLocBody(
    this.uid,
    this.date,
  );
  factory UserAssignLocBody.fromJson(Map<String, dynamic> json) =>
      _$UserAssignLocBodyFromJson(json);
  Map<String, dynamic> toJson() => _$UserAssignLocBodyToJson(this);
}

@JsonSerializable()
class SubmitAbsentBody {
  @JsonKey(name: 'uid')
  String? uid;
  @JsonKey(name: 'tanggal')
  String? date;
  @JsonKey(name: 'periode')
  String? period;
  @JsonKey(name: 'absensi')
  String? absent;
  @JsonKey(name: 'inoutmode')
  String? inoutmode;
  @JsonKey(name: 'jam')
  String? hr;
  @JsonKey(name: 'coordinate')
  String? coordinate;
  @JsonKey(name: 'photo')
  String? photo;
  @JsonKey(name: 'keterangan')
  String? desc;
  @JsonKey(name: 'source')
  String? source;
  @JsonKey(name: 'coorphoto')
  String? coorphoto;

  SubmitAbsentBody(
    this.uid,
    this.date,
    this.period,
    this.absent,
    this.inoutmode,
    this.hr,
    this.coordinate,
    this.photo,
    this.desc,
    this.source,
    this.coorphoto,
  );
  factory SubmitAbsentBody.fromJson(Map<String, dynamic> json) =>
      _$SubmitAbsentBodyFromJson(json);
  Map<String, dynamic> toJson() => _$SubmitAbsentBodyToJson(this);
}
