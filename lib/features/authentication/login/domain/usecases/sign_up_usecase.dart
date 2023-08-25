import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../data/models/sign_up_request_model.dart';
import '../../data/models/sign_up_response_model.dart';
import '../repository/auth_repo.dart';

class SignupUsecase extends UseCase<SignupResponseModel, SignupRequestModel> {
  AuthRepository repository;
  SignupUsecase(this.repository);

  @override
  Future<Either<Failure, SignupResponseModel>> call(
      SignupRequestModel params) async {
    return await repository.signupUser(params);
  }
}
