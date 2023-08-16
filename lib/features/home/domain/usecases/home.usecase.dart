import 'package:equatable/equatable.dart';
import '../../domain/domain.dart';
import '../../../../core/core.dart';

class GetProfileInfoUseCase extends UseCase<DataState, GetProfileParams> {
  final HomeRepository _repos;
  GetProfileInfoUseCase(this._repos);

  @override
  Future<DataState> call(GetProfileParams params) async {
    var res = await _repos.getProfileInfo(params.uid);
    return res;
  }
}

class GetProfileParams extends Equatable {
  final String uid;
  const GetProfileParams(this.uid);

  @override
  List<Object?> get props => [uid];
}
