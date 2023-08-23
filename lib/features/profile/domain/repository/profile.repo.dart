import '../../../../lib.dart';

abstract class ProfileRepository {
  Future<DataState> getProfileInfo(String uid);
  Future<DataState> getAbsentInfo(String uid, String period, String onmobile);
  Future<DataState> getPersonalInfo();
  Future<DataState> getJobHistory(String uid);
  Future<DataState> getEmergencyContact(String uid);
  Future<DataState> getFamilyInfo(String uid);
  Future<DataState> getEducationInfo(String uid);
  Future<DataState> getPayrollInfo(String uid);
  Future<DataState> getAddressInfo(String uid);
}
