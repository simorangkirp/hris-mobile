import 'package:camera/camera.dart';
import 'package:owl_hris/core/resources/data.state.dart';
import 'package:owl_hris/core/usecases/usecases.dart';

import '../repository/absent.repository.dart';

//? Get current period usecase
class GetUserCurrentPeriodAbsentList extends UseCase<DataState, String> {
  final AbsentRepository repos;
  GetUserCurrentPeriodAbsentList(this.repos);
  @override
  Future<DataState> call(String params) async {
    var res = await repos.getCurrentPeriodAbsent();
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
