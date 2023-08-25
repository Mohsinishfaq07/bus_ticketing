import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../data/models/login_request_model.dart';
import '../../data/models/login_response_modal.dart';
import '../../data/models/sign_up_request_model.dart';
import '../../data/models/sign_up_response_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginResponseModel>> loginUser(
      LoginRequestModel params);

  Future<Either<Failure, SignupResponseModel>> signupUser(
      SignupRequestModel params);
}
