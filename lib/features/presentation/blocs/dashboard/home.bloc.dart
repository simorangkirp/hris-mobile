import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../lib.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetProfileInfoUseCase usecase;
  final DashboardGetListApprovalMsg appListMsgUsecase;
  HomeBloc(
    this.usecase,
    this.appListMsgUsecase,
  ) : super(HomeLoading()) {
    on<InitHome>(init);
    on<GetProfileInfo>(getProfile);
    on<GetListAppMsg>(getListApprvMsg);
  }

  void init(InitHome event, Emitter<HomeState> emit) async {
    emit(HomeInitiallized());
  }

  void getListApprvMsg(GetListAppMsg event, Emitter<HomeState> emit) async {
    final dataState = await appListMsgUsecase.call(NoParams());
    if (dataState is DataSuccess) {
      List<ApprovalCountModel> list = [];
      var listAbsent = dataState.data['data'];
      if (dataState.data['data'] is List) {
        for (var i in (listAbsent as List)) {
          list.add(ApprovalCountModel.fromJson(i));
        }
      }
      if (list.isNotEmpty) {
        emit(DashboardListAppMsgLoaded(list));
      } else {
        emit(const ErrorMessage('err'));
      }
    }
  }

  void getProfile(GetProfileInfo event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    var uid = '';
    UserAuthDb auth = UserAuthDb();
    final res = await auth.getUser();
    if (res != null) {
      uid = res.uid!;
    }
    final dataState = await usecase.call(Params(uid));
    if (dataState is DataSuccess) {
      if (dataState.data != null) {
        var begin = dataState.data['data'] as Map<String, dynamic>;
        log('$begin');
        var data = ProfileModel.fromJson(begin);
        log('Profile Data: $data');
        emit(ProfileDataLoaded(data));
      }
    }
    if (dataState is DataError) {
      var msg = '';
      if (dataState.error != null) {
        if (dataState.error!.response != null) {
          if (dataState.error!.response!.data != null) {
            var data = dataState.error!.response!.data as Map<String, dynamic>;
            if (data['status'] == 401) {
              msg = data['messages'];
              emit(DashboardInvalidVersion(msg));
              return;
            } else {
              msg = data['messages'];
              log(msg);
            }
          }
        }
      } else {
        msg = "The request returned an invalid status code of 400.";
      }
      emit(ErrorMessage(msg));
    }
  }
}
