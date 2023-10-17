import 'package:camera/camera.dart';

import '../../../lib.dart';

abstract class AbsentRepository {
  //! Call Api to get current period absent list
  // This Api call need current month parameter ex. 2023-06 & onmobile : 1
  Future<DataState> getCurrentPeriodAbsent(
      String uid, String period, String onmobile);

  //! Call Api to submit user's clock in
  // This Api call need parameter of :
  // uid, tanggal, periode, absensi, inoutmode, jam, coordinate, photo, keterangan, source, coorphoto
  Future<DataState> submitUserAbsent(SubmitUserAbsentParams params);

  Future<DataState> getUserAssignLoc();
  Future<DataState> getUserActPeriod();
  Future<DataState> getUserInfo();
  Future<DataState> getHolidayList();

  //! Call Api to describe users selected absent detail
  // This Api call need parameter of :
  // uid, tanggal, absenid
  Future<DataState> getAbsentDetails();

  Future<DataState> checkPin(String params);

  //! Get List of Camera
  Future<List<CameraDescription>> getListCamera();
}
