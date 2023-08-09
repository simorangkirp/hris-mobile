import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';
import 'package:owl_hris/core/resources/data.state.dart';
import 'package:owl_hris/core/usecases/usecases.dart';

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
