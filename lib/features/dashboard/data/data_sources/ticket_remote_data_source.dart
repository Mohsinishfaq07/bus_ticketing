import 'dart:async';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:sb_myreports/core/modals/no_params.dart';
import 'package:sb_myreports/features/dashboard/data/modals/get_user_history_reaponse_model.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/modals/error_response_model.dart';
import '../../../../core/utils/constants/app_messages.dart';
import '../../../../core/utils/constants/app_url.dart';

abstract class TicketRemoteDataSource {
  ///
  Future<GetUserHistoryResponseModel> getUserHistory(NoParams params);
}

class TicketRemoteDataSourceImp implements TicketRemoteDataSource {
  Dio dio;
  TicketRemoteDataSourceImp({required this.dio});

  @override
  Future<GetUserHistoryResponseModel> getUserHistory(NoParams params) async {
    String url = AppUrl.baseUrl + AppUrl.getUserHistoryUrl;

    try {
      final response = await dio.get(url);

      // var decryptedResponse = Encryption.decryptObject(response.data['Text']);
      // var jsonResponse = jsonDecode(decryptedResponse);

      if (response.statusCode == 200) {
        var object = GetUserHistoryResponseModel.fromJson(response.data);

        // var object = RegisterCardAgainstUserResponseModel.fromJson(jsonResponse);

        return object;
      }

      throw const SomethingWentWrong(AppMessages.somethingWentWrong);
    } on DioError catch (exception) {
      Logger().i('returning error');
      if (exception.type == DioErrorType.connectTimeout) {
        throw TimeoutException(AppMessages.timeOut);
      } else {
        // var decryptedResponse = Encryption.decryptObject(exception.response?.data['Text']);
        // var jsonResponse = jsonDecode(decryptedResponse);
        ErrorResponseModel errorResponseModel =
            ErrorResponseModel.fromJson(exception.response?.data);
        throw SomethingWentWrong(errorResponseModel.message);
      }
    } catch (e) {
      throw SomethingWentWrong(e.toString());
    }
  }
}
