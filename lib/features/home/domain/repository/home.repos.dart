import 'package:owl_hris/core/core.dart';

abstract class HomeRepository {
  Future<DataState> getProfileInfo(String uid);
  Future<DataState> getAnnouncementBanner();
  Future<DataState> getActiveTask();
}
