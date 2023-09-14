import 'package:owl_hris/core/core.dart';

abstract class NotificationRepository{
  Future<DataState> getListNotif();
  Future<DataState> getListApproval();
}