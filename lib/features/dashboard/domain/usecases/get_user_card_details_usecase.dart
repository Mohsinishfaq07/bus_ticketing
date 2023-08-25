import 'package:dartz/dartz.dart';
import 'package:sb_myreports/core/modals/no_params.dart';
import 'package:sb_myreports/features/dashboard/domain/repository/user_queries_repo.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../data/modals/get_user_card_details_response_model.dart';

class GetUserCardDetailsUsecase
    extends UseCase<GetUserCardDetailsResponseModel, NoParams> {
  UserQueriesRepository repository;
  GetUserCardDetailsUsecase(this.repository);

  @override
  Future<Either<Failure, GetUserCardDetailsResponseModel>> call(
      NoParams params) async {
    return await repository.getUserCardDetails(params);
  }
}
