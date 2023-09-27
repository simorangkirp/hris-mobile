import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../lib.dart';

class PaidLeaveBloc extends Bloc<PaidLeaveEvent, PaidLeaveState> {
  final GetPersonalInfoPaidLeave userUsecase;
  final PaidLeaveGetPlafondUseCase plafondUsecase;
  final PaidLeaveGetListDataUseCase listDataUsecase;
  final PaidLeaveGetDataDetailUseCase dataDetailUsecase;
  final PaidLeaveSubmitDataUseCase submitUsecase;
  final PaidLeaveGetCategoryUseCase categoryUsecase;
  final PaidLeaveGetCategoryDetailUseCase catDetailUsecase;
  PaidLeaveBloc(
    this.userUsecase,
    this.plafondUsecase,
    this.listDataUsecase,
    this.dataDetailUsecase,
    this.submitUsecase,
    this.categoryUsecase,
    this.catDetailUsecase,
  ) : super(PaidLeaveLoading()) {
    on<PaidLeaveInit>(onInit);
    on<PaidLeaveGetPlafond>(getPlafond);
    on<PaidLeaveGetListData>(getListData);
    on<PaidLeaveGetDataDetail>(getDataDetail);
    on<PaidLeaveSubmitData>(submitData);
    on<PaidLeaveGetCategory>(getCategory);
    on<PaidLeaveGetCatDetail>(getCatDetail);
    on<PaidLeaveGetUserData>(getUserData);
    // on<SubmitLogin>(onLoginUser);
  }

  void onInit(PaidLeaveInit event, Emitter<PaidLeaveState> emit) async {
    emit(PaidLeaveInitiallized());
  }

  void getPlafond(
      PaidLeaveGetPlafond event, Emitter<PaidLeaveState> emit) async {
    emit(PaidLeaveLoading());
    String errMsg = '';
    final dataState = await plafondUsecase.call(NoParams());
    if (dataState is DataSuccess) {
      if (dataState.data != null) {
        var begin = dataState.data['data'] as Map<String, dynamic>;
        var data = PaidLeavePlafond.fromMap(begin);
        emit(PaidLeavePlafondLoaded(data));
      }
    }
    if (dataState is DataError) {
      if (dataState.error != null) {
        if (dataState.error!.response != null) {
          if (dataState.error!.response!.data != null) {
            errMsg = dataState.error!.response!.data['messages'];
          }
        }
      } else {
        errMsg = "The request returned an invalid status code of 400.";
      }
      emit(PaidLeaveErrCall(errMsg));
    }
  }

  void getListData(
      PaidLeaveGetListData event, Emitter<PaidLeaveState> emit) async {
    emit(PaidLeaveLoading());
    UserAuthDb auth = UserAuthDb();
    final res = await auth.getUser();

    final dataState = await plafondUsecase.call();
    if (dataState is DataSuccess) {
      List<AbsentListModel> list = [];
      var listAbsent = dataState.data['data'];
      if (dataState.data['data'] is List) {
        for (var i in (listAbsent as List)) {
          list.add(AbsentListModel.fromJson(i));
        }
      }
      if (list.isNotEmpty) {
        emit(AbsentPeriodLoaded(list));
      } else {
        emit(DataStateError(dataState.error!));
      }
    }
  }

  void getDataDetail(
      PaidLeaveGetDataDetail event, Emitter<PaidLeaveState> emit) async {
    emit(PaidLeaveLoading());
    String errMsg = '';
    final dataState = await plafondUsecase.call(NoParams());
    if (dataState is DataSuccess) {
      if (dataState.data != null) {
        var begin = dataState.data['data'] as Map<String, dynamic>;
        var data = PaidLeaveDataDetail.fromMap(begin);
        emit(PaidLeaveDetailLoaded(data));
      }
    }
    if (dataState is DataError) {
      if (dataState.error != null) {
        if (dataState.error!.response != null) {
          if (dataState.error!.response!.data != null) {
            errMsg = dataState.error!.response!.data['messages'];
          }
        }
      } else {
        errMsg = "The request returned an invalid status code of 400.";
      }
      emit(PaidLeaveErrCall(errMsg));
    }
  }

  void submitData(
      PaidLeaveSubmitData event, Emitter<PaidLeaveState> emit) async {
    String errMsg = '';
    final dataState = await plafondUsecase.call(NoParams());
    if (dataState is DataSuccess) {
      if (dataState.data != null) {
        var begin = dataState.data['data'] as Map<String, dynamic>;
        var data = PaidLeaveDataDetail.fromMap(begin);
        emit(PaidLeaveDetailLoaded(data));
      }
    }
    if (dataState is DataError) {
      if (dataState.error != null) {
        if (dataState.error!.response != null) {
          if (dataState.error!.response!.data != null) {
            errMsg = dataState.error!.response!.data['messages'];
          }
        }
      } else {
        errMsg = "The request returned an invalid status code of 400.";
      }
      emit(PaidLeaveErrCall(errMsg));
    }
  }

  void getCategory(
      PaidLeaveGetCategory event, Emitter<PaidLeaveState> emit) async {
    emit(PaidLeaveLoading());
    String errMsg = '';
    final dataState = await plafondUsecase.call(NoParams());
    if (dataState is DataSuccess) {
      if (dataState.data != null) {
        var begin = dataState.data['data'] as Map<String, dynamic>;
        var data = PaidLeaveDataDetail.fromMap(begin);
        emit(PaidLeaveDetailLoaded(data));
      }
    }
    if (dataState is DataError) {
      if (dataState.error != null) {
        if (dataState.error!.response != null) {
          if (dataState.error!.response!.data != null) {
            errMsg = dataState.error!.response!.data['messages'];
          }
        }
      } else {
        errMsg = "The request returned an invalid status code of 400.";
      }
      emit(PaidLeaveErrCall(errMsg));
    }
  }

  void getCatDetail(
      PaidLeaveGetCatDetail event, Emitter<PaidLeaveState> emit) async {
    emit(PaidLeaveLoading());
    String errMsg = '';
    final dataState = await plafondUsecase.call(NoParams());
    if (dataState is DataSuccess) {
      if (dataState.data != null) {
        var begin = dataState.data['data'] as Map<String, dynamic>;
        var data = PaidLeaveCatDetail.fromMap(begin);
        emit(PaidLeaveCatDetailLoaded(data));
      }
    }
    if (dataState is DataError) {
      if (dataState.error != null) {
        if (dataState.error!.response != null) {
          if (dataState.error!.response!.data != null) {
            errMsg = dataState.error!.response!.data['messages'];
          }
        }
      } else {
        errMsg = "The request returned an invalid status code of 400.";
      }
      emit(PaidLeaveErrCall(errMsg));
    }
  }

  void getUserData(PaidLeaveGetUserData event, Emitter<PaidLeaveState> emit) {}
}
