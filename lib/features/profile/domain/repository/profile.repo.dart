import '../../../../lib.dart';

abstract class ProfileRepository {
  Future<DataState> getProfileInfo(String uid);
  Future<DataState> getPersonalData();
  Future<DataState> getAbsentInfo(String uid, String period, String onmobile);
  Future<DataState> getActPeriod(String lokasi, String period);
  Future<DataState> getPersonalInfo();
  Future<DataState> getJobHistory();
  Future<DataState> getEmergencyContact();
  Future<DataState> getFamilyInfo();
  Future<DataState> getEducationInfo();
  Future<DataState> getPayrollInfo();
  Future<DataState> getAddressInfo();
}
