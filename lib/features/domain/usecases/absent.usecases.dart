import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';
import 'package:owl_hris/core/resources/data.state.dart';
import 'package:owl_hris/core/usecases/usecases.dart';

import '../../../lib.dart';
import '../repository/absent.repository.dart';

//? Get current period usecase
class GetUserCurrentPeriodAbsentList
    extends UseCase<DataState, ListAbsentParam> {
  final AbsentRepository repos;
  GetUserCurrentPeriodAbsentList(this.repos);
  @override
  Future<DataState> call(ListAbsentParam params) async {
    var res = await repos.getCurrentPeriodAbsent(
        params.uid, params.period, params.onmobile);
    return res;
  }
}

class GetUserAssignLocationUseCase extends UseCase<DataState, NoParams> {
  final AbsentRepository repos;
  GetUserAssignLocationUseCase(this.repos);
  @override
  Future<DataState> call(NoParams params) async {
    var res = await repos.getUserAssignLoc();
    return res;
  }
}

class GetHolidayListUsecase extends UseCase<DataState, NoParams> {
  final AbsentRepository repos;
  GetHolidayListUsecase(this.repos);
  @override
  Future<DataState> call(NoParams params) async {
    var res = await repos.getHolidayList();
    return res;
  }
}

class AbsentCheckPINUseCase extends UseCase<DataState, String> {
  final AbsentRepository repos;
  AbsentCheckPINUseCase(this.repos);
  @override
  Future<DataState> call(String params) async {
    var res = await repos.checkPin(params);
    return res;
  }
}

class AbsentUsecaseGetActPeriod extends UseCase<DataState, GetActPeriodParams> {
  final AbsentRepository repos;
  AbsentUsecaseGetActPeriod(this.repos);
  @override
  Future<DataState> call(GetActPeriodParams params) async {
    var res = await repos.getUserActPeriod(params.period, params.lokasi);
    return res;
  }
}

class AbsentUsecaseGetUserInfo extends UseCase<DataState, NoParams> {
  final AbsentRepository repos;
  AbsentUsecaseGetUserInfo(this.repos);
  @override
  Future<DataState> call(NoParams params) async {
    var res = await repos.getUserInfo();
    return res;
  }
}

class SubmitUserAbsentUseCase
    extends UseCase<DataState, SubmitUserAbsentParams> {
  final AbsentRepository repos;
  SubmitUserAbsentUseCase(this.repos);
  @override
  Future<DataState> call(SubmitUserAbsentParams params) async {
    var res = await repos.submitUserAbsent(params);
    return res;
  }
}

//? Get List of Camera
class GetListCameraClockIn extends UseCase<List<CameraDescription>, NoParams> {
  final AbsentRepository repos;
  GetListCameraClockIn(this.repos);

  @override
  Future<List<CameraDescription>> call(NoParams params) async {
    var res = await repos.getListCamera();
    return res;
  }
}

class ListAbsentParam extends Equatable {
  final String uid;
  final String period;
  final String onmobile;

  const ListAbsentParam(
      {required this.uid, required this.period, required this.onmobile});

  @override
  List<Object> get props => [uid, period, onmobile];
}

class SubmitUserAbsentParams extends Equatable {
  final String date;
  final String period;
  final String absent;
  final String inoutmode;
  final String hr;
  final String coordinate;
  final String photo;
  final String desc;
  final String source;
  final String coorphoto;
  const SubmitUserAbsentParams(
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

  @override
  List<Object?> get props => [
        date,
        period,
        absent,
        inoutmode,
        hr,
        coordinate,
        photo,
        desc,
        source,
        coorphoto,
      ];
}
