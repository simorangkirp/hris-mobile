import 'package:equatable/equatable.dart';

import '../../../../lib.dart';

class GetProfileScreenProfileInfo extends UseCase<DataState, GetProfileParams> {
  final ProfileRepository _repos;
  GetProfileScreenProfileInfo(this._repos);

  @override
  Future<DataState> call(GetProfileParams params) async {
    var res = await _repos.getProfileInfo(params.uid);
    return res;
  }
}

class GetProfileScreenJobInfo extends UseCase<DataState, GetProfileParams> {
  final ProfileRepository _repos;
  GetProfileScreenJobInfo(this._repos);

  @override
  Future<DataState> call(GetProfileParams params) async {
    var res = await _repos.getJobHistory(params.uid);
    return res;
  }
}

class GetProfileScreenAbsentInfo extends UseCase<DataState, GetAbsentParams> {
  final ProfileRepository _repos;
  GetProfileScreenAbsentInfo(this._repos);

  @override
  Future<DataState> call(GetAbsentParams params) async {
    var res = await _repos.getAbsentInfo(params.uid, params.period, params.onmobile);
    return res;
  }
}

class GetProfileScreenEmerContactInfo
    extends UseCase<DataState, GetProfileParams> {
  final ProfileRepository _repos;
  GetProfileScreenEmerContactInfo(this._repos);

  @override
  Future<DataState> call(GetProfileParams params) async {
    var res = await _repos.getEmergencyContact(params.uid);
    return res;
  }
}

class GetProfileScreenFamilyInfo extends UseCase<DataState, GetProfileParams> {
  final ProfileRepository _repos;
  GetProfileScreenFamilyInfo(this._repos);

  @override
  Future<DataState> call(GetProfileParams params) async {
    var res = await _repos.getFamilyInfo(params.uid);
    return res;
  }
}

class GetProfileScreenEducationInfo
    extends UseCase<DataState, GetProfileParams> {
  final ProfileRepository _repos;
  GetProfileScreenEducationInfo(this._repos);

  @override
  Future<DataState> call(GetProfileParams params) async {
    var res = await _repos.getEducationInfo(params.uid);
    return res;
  }
}

class GetProfileScreenPayrollInfo extends UseCase<DataState, GetProfileParams> {
  final ProfileRepository _repos;
  GetProfileScreenPayrollInfo(this._repos);

  @override
  Future<DataState> call(GetProfileParams params) async {
    var res = await _repos.getPayrollInfo(params.uid);
    return res;
  }
}

class GetProfileScreenAddressInfo extends UseCase<DataState, GetProfileParams> {
  final ProfileRepository _repos;
  GetProfileScreenAddressInfo(this._repos);

  @override
  Future<DataState> call(GetProfileParams params) async {
    var res = await _repos.getAddressInfo(params.uid);
    return res;
  }
}

class GetProfileParams extends Equatable {
  final String uid;
  const GetProfileParams(this.uid);

  @override
  List<Object?> get props => [uid];
}

class GetAbsentParams extends Equatable {
  final String uid;
  final String period;
  final String onmobile;
  const GetAbsentParams(this.uid, this.period, this.onmobile);

  @override
  List<Object?> get props => [uid];
}
