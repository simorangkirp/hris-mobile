import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../lib.dart';

class ApprovalScrnBloc extends Bloc<ApprovalEvent, ApprovalState> {
  final GetApprovalListDataUsecase listUsecase;
  final GetApprovalDataDetail detailUsecase;
  final SubmitApprovalDataResponse submitUsecase;
  ApprovalScrnBloc(
    this.listUsecase,
    this.detailUsecase,
    this.submitUsecase,
  ) : super(ApprovalScrnLoading()) {
    on<ApprovalScrnInit>(init);
    on<ApprovalScrnGetApproval>(getListApprv);
    on<ApprovalScrnGetApprovalDataDetail>(getApprvDataDetail);
    on<ApprovalScrnSubmitResponse>(submitApprvDataResponse);
  }

  void init(ApprovalScrnInit event, Emitter<ApprovalState> emit) async {
    emit(ApprovalScrnInitiallized());
  }

  void getListApprv(
      ApprovalScrnGetApproval event, Emitter<ApprovalState> emit) async {
    emit(ApprovalScrnLoading());
    final dataState =
        await listUsecase.call(ApprvListDataParams('', event.type, '1'));
    if (dataState is DataSuccess) {
      List<ApprovalModel> list = [];
      var listAbsent = dataState.data['data'];
      if (dataState.data['data'] is List) {
        for (var i in (listAbsent as List)) {
          list.add(ApprovalModel.fromJson(i));
        }
      }
      if (list.isNotEmpty) {
        emit(ApprovalListLoaded(list));
      } else {
        emit(ApprovalScrnDataErr(dataState.error!));
      }
    }
  }

  void getApprvDataDetail(ApprovalScrnGetApprovalDataDetail event,
      Emitter<ApprovalState> emit) async {
    emit(ApprovalScrnLoading());
    final dataState = await detailUsecase.call(event.param);
    if (dataState is DataSuccess) {
      // List<ApprovalCountModel> list = [];
      var begin = dataState.data['data'] as Map<String, dynamic>;
      var data = ApprovalDetailModel.fromJson(begin);
      // if (dataState.data['data'] is List) {
      //   for (var i in (listAbsent as List)) {
      //     list.add(ApprovalCountModel.fromJson(i));
      //   }
      // }
      // if (list.isNotEmpty) {
      emit(ApprovalDataDetailLoaded(data));
      // } else {
      // }
    } else {
      emit(ApprovalScrnDataErr(dataState.error!));
    }
  }

  void submitApprvDataResponse(
      ApprovalScrnSubmitResponse event, Emitter<ApprovalState> emit) async {
    emit(ApprovalScrnLoading());
    Future.delayed(const Duration(seconds: 2)).then((value) => null);
    final dataState = await submitUsecase.call(event.param);
    if (dataState is DataSuccess) {
      // List<ApprovalCountModel> list = [];
      var msg = dataState.data['messages'];
      emit(ApprovalResponseSubmited(msg));
      // emit(ApprovalDataDetailLoaded(data));
      // log(data.)
    }
    if (dataState is DataError) {
      var msg = dataState.error?.response?.data['messages'] ?? "";
      emit(ApprovalResponseSubmited(msg));
    } else {
      emit(ApprovalScrnDataErr(dataState.error!));
    }
  }
}
