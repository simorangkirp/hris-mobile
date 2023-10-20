import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../lib.dart';

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
    List<PaidLeavePlafond> listData = [];
    final dataState = await plafondUsecase.call(NoParams());
    if (dataState is DataSuccess) {
      if (dataState.data != null) {
        if (dataState.data['data'] is List) {
          if ((dataState.data['data'] as List).isEmpty) {
            errMsg = dataState.data['messages'];
            emit(PaidLeaveErrCall(errMsg));
          } else {
            for (var i in (dataState.data['data'] as List)) {
              listData.add(PaidLeavePlafond.fromMap(i));
            }
            emit(PaidLeavePlafondLoaded(listData));
          }
        }
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
    emit(PaidLeaveSearchLoading());
    String errMsg = '';
    final dataState = await listDataUsecase.call(event.period);
    if (dataState is DataSuccess) {
      List<PaidLeaveListData> list = [];
      var listAbsent = dataState.data['data'];
      if (dataState.data['data'] is List) {
        for (var i in (listAbsent as List)) {
          list.add(PaidLeaveListData.fromMap(i));
        }
      }
      emit(PaidLeaveListDataLoaded(list));
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

  void getDataDetail(
      PaidLeaveGetDataDetail event, Emitter<PaidLeaveState> emit) async {
    emit(PaidLeaveLoading());
    String errMsg = '';
    final dataState = await dataDetailUsecase.call(event.noTxn);
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
    emit(PaidLeaveSubmitFormLoading());
    String errMsg = '';
    final dataState = await submitUsecase.call(event.data);
    if (dataState is DataSuccess) {
      if (dataState.data != null) {
        errMsg = dataState.data['messages'];
        // var data = PaidLeaveDataDetail.fromMap(begin);
        emit(PaidLeaveSubmitFormSuccess(errMsg));
      }
    }
    if (dataState is DataError) {
      if (dataState.error != null) {
        if (dataState.error!.response != null) {
          if (dataState.error!.response!.data != null) {
            errMsg = dataState.error!.response!.data['messages']['error'];
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
    final dataState = await categoryUsecase.call(NoParams());
    if (dataState is DataSuccess) {
      List<PaidLeaveCategory> list = [];
      if (dataState.data != null) {
        var listCat = dataState.data['data'];
        if (dataState.data['data'] is List) {
          for (var i in (listCat as List)) {
            list.add(PaidLeaveCategory.fromMap(i));
          }
        }
        emit(PaidLeaveCatLoaded(list));
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
    final dataState = await catDetailUsecase.call(event.id);
    if (dataState is DataSuccess) {
      List<PaidLeaveCatDetail> list = [];
      if (dataState.data != null) {
        if (dataState.data != null) {
          var listCat = dataState.data['data'];
          if (dataState.data['data'] is List) {
            for (var i in (listCat as List)) {
              list.add(PaidLeaveCatDetail.fromMap(i));
            }
          }
        }
        emit(PaidLeaveCatDetailLoaded(list));
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

  void getUserData(
      PaidLeaveGetUserData event, Emitter<PaidLeaveState> emit) async {
    emit(PaidLeaveLoading());
    final dataState = await userUsecase.call(NoParams());
    if (dataState is DataSuccess) {
      if (dataState.data != null) {
        emit(PaidLeaveProfileLoaded(dataState.data));
      }
    }
  }
}
