import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../data/modals/link_card_request_model.dart';
import '../../data/modals/link_card_response_model.dart';
import '../repository/user_queries_repo.dart';

class LinkCardUsecase
    extends UseCase<LinkCardResponseModel, LinkCardRequestModel> {
  UserQueriesRepository repository;
  LinkCardUsecase(this.repository);

  @override
  Future<Either<Failure, LinkCardResponseModel>> call(
      LinkCardRequestModel params) async {
    return await repository.linkCard(params);
  }
}
