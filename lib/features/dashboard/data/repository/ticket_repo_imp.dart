import 'package:dartz/dartz.dart';
import 'package:sb_myreports/core/modals/no_params.dart';
import 'package:sb_myreports/features/dashboard/data/modals/get_user_history_reaponse_model.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/utils/constants/app_messages.dart';
import '../../../../../core/utils/network/network_info.dart';
import '../../domain/repository/ticket_repo.dart';
import '../data_sources/ticket_remote_data_source.dart';

class TicketRepoImp extends TicketRepository {
  final NetworkInfo networkInfo;

  final TicketRemoteDataSource remoteDataSource;

  TicketRepoImp({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, GetUserHistoryResponseModel>> getUserHistory(
      NoParams params) async {
    if (!await networkInfo.isConnected) {
      return const Left(NetworkFailure(AppMessages.noInternet));
    }
    try {
      return Right(await remoteDataSource.getUserHistory(params));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e));
    }
  }
}
