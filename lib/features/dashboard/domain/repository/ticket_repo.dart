import 'package:dartz/dartz.dart';
import 'package:sb_myreports/core/modals/no_params.dart';

import '../../../../../core/error/failures.dart';
import '../../data/modals/get_user_history_reaponse_model.dart';

abstract class TicketRepository {
  ///
  Future<Either<Failure, GetUserHistoryResponseModel>> getUserHistory(
      NoParams params);
}
