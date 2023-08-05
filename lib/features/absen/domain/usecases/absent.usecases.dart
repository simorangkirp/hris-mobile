import 'package:owl_hris/core/resources/data.state.dart';
import 'package:owl_hris/core/usecases/usecases.dart';

import '../repository/absent.repository.dart';

//? Get current period usecase
class GetUserCurrenPeriodAbsentList extends UseCase<DataState, String> {
  final AbsentRepository repos;
  GetUserCurrenPeriodAbsentList(this.repos);
  @override
  Future<DataState> call(String params) async {
    var res = await repos.getCurrentPeriodAbsent();
    return res;
  }
}
