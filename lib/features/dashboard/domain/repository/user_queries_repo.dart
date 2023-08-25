import 'package:dartz/dartz.dart';
import 'package:sb_myreports/core/modals/no_params.dart';

import '../../../../../core/error/failures.dart';
import '../../data/modals/get_user_card_details_response_model.dart';
import '../../data/modals/link_card_request_model.dart';
import '../../data/modals/link_card_response_model.dart';

abstract class UserQueriesRepository {
  ///
  Future<Either<Failure, LinkCardResponseModel>> linkCard(
      LinkCardRequestModel params);

  ///
  Future<Either<Failure, GetUserCardDetailsResponseModel>> getUserCardDetails(
      NoParams params);
}
