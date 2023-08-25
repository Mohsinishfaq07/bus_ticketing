import 'dart:async';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:sb_myreports/core/modals/no_params.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/modals/error_response_model.dart';
import '../../../../core/utils/constants/app_messages.dart';
import '../../../../core/utils/constants/app_url.dart';
import '../modals/get_user_card_details_response_model.dart';
import '../modals/link_card_request_model.dart';
import '../modals/link_card_response_model.dart';

abstract class UserQueriesRemoteDataSource {
  ///
  Future<LinkCardResponseModel> linkCard(LinkCardRequestModel params);
  Future<GetUserCardDetailsResponseModel> getUserCardDetails(NoParams params);
}

class UserQueriesRemoteDataSourceImp implements UserQueriesRemoteDataSource {
  Dio dio;
  UserQueriesRemoteDataSourceImp({required this.dio});

  @override
  Future<LinkCardResponseModel> linkCard(LinkCardRequestModel params) async {
    String url = AppUrl.baseUrl + AppUrl.linkCardUrl;

    try {
      final response = await dio.patch(url, data: params.toJson());
      if (response.statusCode == 200) {
        var object = LinkCardResponseModel.fromJson(response.data);
        return object;
      }

      throw const SomethingWentWrong(AppMessages.somethingWentWrong);
    } on DioError catch (exception) {
      Logger().i('returning error');
      if (exception.type == DioErrorType.connectTimeout) {
        throw TimeoutException(AppMessages.timeOut);
      } else {
        ErrorResponseModel errorResponseModel =
            ErrorResponseModel.fromJson(exception.response?.data);
        throw SomethingWentWrong(errorResponseModel.message);
      }
    } catch (e) {
      throw SomethingWentWrong(e.toString());
    }
  }

  @override
  Future<GetUserCardDetailsResponseModel> getUserCardDetails(
      NoParams params) async {
    String url = AppUrl.baseUrl + AppUrl.getCardByCardHolderUrl;
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        var object = GetUserCardDetailsResponseModel.fromJson(response.data);
        return object;
      }

      throw const SomethingWentWrong(AppMessages.somethingWentWrong);
    } on DioError catch (exception) {
      Logger().i('returning error');
      if (exception.type == DioErrorType.connectTimeout) {
        throw TimeoutException(AppMessages.timeOut);
      } else {
        ErrorResponseModel errorResponseModel =
            ErrorResponseModel.fromJson(exception.response?.data);
        throw SomethingWentWrong(errorResponseModel.message);
      }
    } catch (e) {
      throw SomethingWentWrong(e.toString());
    }
  }
}
