import 'package:equatable/equatable.dart';
import '../../domain/domain.dart';
import '../../../../core/core.dart';

class HomeUseCasesImpl extends HomeUseCases<DataState, GetProfileParams> {
  final HomeRepository _repos;
  HomeUseCasesImpl(this._repos);

  @override
  Future<DataState> getProfile(GetProfileParams param) async {
    var res = await _repos.getProfileInfo(param.uid);
    return res;
  }
}

class GetProfileParams extends Equatable {
  final String uid;
  const GetProfileParams(this.uid);

  @override
  List<Object?> get props => [uid];
}
