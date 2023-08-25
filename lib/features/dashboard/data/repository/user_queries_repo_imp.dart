import 'package:dartz/dartz.dart';
import 'package:sb_myreports/core/modals/no_params.dart';
import 'package:sb_myreports/features/dashboard/data/modals/link_card_response_model.dart';
import 'package:sb_myreports/features/dashboard/data/modals/link_card_request_model.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/utils/constants/app_messages.dart';
import '../../../../../core/utils/network/network_info.dart';
import '../../domain/repository/user_queries_repo.dart';
import '../data_sources/user_queries_remote_data_source.dart';
import '../modals/get_user_card_details_response_model.dart';

class UserQueriesRepoImp extends UserQueriesRepository {
  final NetworkInfo networkInfo;

  final UserQueriesRemoteDataSource remoteDataSource;

  UserQueriesRepoImp({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, LinkCardResponseModel>> linkCard(
      LinkCardRequestModel params) async {
    if (!await networkInfo.isConnected) {
      return const Left(NetworkFailure(AppMessages.noInternet));
    }
    try {
      return Right(await remoteDataSource.linkCard(params));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e));
    }
  }

  @override
  Future<Either<Failure, GetUserCardDetailsResponseModel>> getUserCardDetails(
      NoParams params) async {
    if (!await networkInfo.isConnected) {
      return const Left(NetworkFailure(AppMessages.noInternet));
    }
    try {
      return Right(await remoteDataSource.getUserCardDetails(params));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e));
    }
  }
}
