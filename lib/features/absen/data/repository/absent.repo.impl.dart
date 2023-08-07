import 'package:camera/camera.dart';
import 'package:camera_platform_interface/src/types/camera_description.dart';

import 'package:owl_hris/core/resources/data.state.dart';

import '../../domain/repository/absent.repository.dart';

class AbsentReposImplement implements AbsentRepository {
  // final String userNm, pwd;
  // final LoginAPIServices _loginAPIServices;
  // final UserAuthDb db;
  AbsentReposImplement();

  @override
  Future<DataState> getAbsentDetails() {
    // TODO: implement getAbsentDetails
    throw UnimplementedError();
  }

  @override
  Future<DataState> getCurrentPeriodAbsent() {
    // TODO: implement getCurrentPeriodAbsent
    throw UnimplementedError();
  }

  @override
  Future<List<CameraDescription>> getListCamera() async {
    // Obtain a list of the available cameras on the device.
    final listCamera = await availableCameras();

    // Get a specific camera from the list of available cameras.
    // final firstCamera = cameras.first;
    return listCamera;
  }

  @override
  Future<DataState> submitUserClockIn() {
    // TODO: implement submitUserClockIn
    throw UnimplementedError();
  }
}
