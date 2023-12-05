import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../lib.dart';

class InboxScrnBloc extends Bloc<InboxEvent, InboxState> {
  final NotifScreenGetDataList notifUseCase;
  final NotifScreenGetApprovalList appUseCase;
  InboxScrnBloc(
    this.notifUseCase,
    this.appUseCase,
  ) : super(InboxScrnLoading()) {
    on<InitInboxScreen>(init);
    on<InboxScrnGetListNotif>(getListNotif);
    on<InboxScrnGetApprvlData>(getApprvData);
    on<InboxScrnGetInvalidVersion>(getInvalidMsg);
  }

  void init(InitInboxScreen event, Emitter<InboxState> emit) async {
    emit(InboxScrnInitiallized());
  }

  void getInvalidMsg(
      InboxScrnGetInvalidVersion event, Emitter<InboxState> emit) async {
    emit(InboxInvalidVersion(event.msg));
  }

  void getListNotif(
      InboxScrnGetListNotif event, Emitter<InboxState> emit) async {
    emit(InboxScrnLoading());
    final dataState = await notifUseCase.call(NoParams());
    if (dataState is DataSuccess) {
      List<NotifModel> list = [];
      var listAbsent = dataState.data['data'];
      if (dataState.data['data'] is List) {
        if (dataState.data['data'].isNotEmpty) {
          for (var i in (listAbsent as List)) {
            list.add(NotifModel.fromJson(i));
          }
        }
      }
      // if (list.isNotEmpty) {
      emit(InboxScrnListNotifLoaded(list));
      // }
    } else {
      var msg = '';
      if (dataState.error != null) {
        if (dataState.error!.response != null) {
          if (dataState.error!.response!.data != null) {
            var data = dataState.error!.response!.data as Map<String, dynamic>;
            if (data['status'] == 401) {
              msg = data['messages'];
              emit(InboxInvalidVersion(msg));
              return;
            } else {
              msg = data['messages'];
              // log(msg);
            }
          }
        }
      } else {
        msg = "The request returned an invalid status code of 400.";
      }
      emit(InboxError(msg));
      // emit(InboxScrnDataStateErr(dataState.error!));
    }
  }

  void getApprvData(
      InboxScrnGetApprvlData event, Emitter<InboxState> emit) async {
    emit(InboxScrnLoading());
    final dataState = await appUseCase.call(NoParams());
    if (dataState is DataSuccess) {
      List<ApprovalCountModel> list = [];
      var listAbsent = dataState.data['data'];
      if (dataState.data['data'] is List) {
        for (var i in (listAbsent as List)) {
          list.add(ApprovalCountModel.fromJson(i));
        }
      }
      if (list.isNotEmpty) {
        emit(InboxScrnApprvDataLoaded(list));
      } else {
        emit(InboxScrnDataStateErr(dataState.error!));
      }
    }
  }
}
