import 'package:equatable/equatable.dart';
import '../../domain/domain.dart';
import '../../../../core/core.dart';

class GetProfileInfoUseCase extends UseCase<DataState, Params> {
  final HomeRepository _repos;
  GetProfileInfoUseCase(this._repos);

  @override
  Future<DataState> call(Params params) async {
    var res = await _repos.getProfileInfo(params.uid);
    return res;
  }
}

class Params extends Equatable {
  final String uid;
  const Params(this.uid);

  @override
  List<Object?> get props => [uid];
}
