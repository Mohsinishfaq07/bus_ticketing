import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../core/modals/no_params.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/modals/get_user_history_reaponse_model.dart';
import '../repository/ticket_repo.dart';

class GetUserHistoryUsecase
    extends UseCase<GetUserHistoryResponseModel, NoParams> {
  TicketRepository repository;
  GetUserHistoryUsecase(this.repository);

  @override
  Future<Either<Failure, GetUserHistoryResponseModel>> call(
      NoParams params) async {
    return await repository.getUserHistory(params);
  }
}
