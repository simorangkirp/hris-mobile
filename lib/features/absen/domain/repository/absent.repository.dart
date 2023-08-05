import 'package:owl_hris/core/resources/data.state.dart';

abstract class AbsentRepository {
  //! Call Api to get current period absent list
  // This Api call need current month parameter ex. 2023-06
  Future<DataState> getCurrentPeriodAbsent();

  //! Call Api to submit user's clock in
  // This Api call need parameter of :
  // uid, tanggal, periode, absensi, inoutmode, jam, coordinate, photo, keterangan, source, coorphoto 
  Future<DataState> submitUserClockIn();

  //! Call Api to describe users selected absent detail
  // This Api call need parameter of :
  // uid, tanggal, absenid
  Future<DataState> getAbsentDetails();
}