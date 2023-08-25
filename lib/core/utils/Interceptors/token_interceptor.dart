import 'package:dio/dio.dart';
import 'package:sb_myreports/core/utils/globals/globals.dart';
import 'package:sb_myreports/features/authentication/login/presentation/manager/auth_provider.dart';

setTokenInterceptor() {
  Dio dio = sl();
  AuthProvider accountProvider = sl();

  dio.interceptors
      .add(InterceptorsWrapper(onRequest: (RequestOptions options, handler) {
    if (accountProvider.loginResponseModel != null) {
      options.headers['Authorization'] =
          'Bearer ' + accountProvider.loginResponseModel!.token!;
      // options.headers['USER'] = accountProvider.userDetails!.userDetails.id;
    }
    return handler.next(options);
  }, onResponse: (Response response, handler) {
    //     Logger().v(response.requestOptions.path);
    // var decryptedResponse =
    // Encryption.decryptObject(response.data['Text']);
    //     Logger().v(decryptedResponse);
    return handler.next(response);
  }, onError: (DioError error, handler) async {
    // if (error.response!.statusCode == 401) {
    // final requestBody = {
    //   'refreshToken': accountProvider.userDetails!.userDetails.refreshToken,
    //   'imei': accountProvider.imei,
    //   'ip': accountProvider.ip,
    //   'deviceName': accountProvider.deviceName,
    //   'androidVersion': accountProvider.androidVersion,
    //   'appVersion': accountProvider.appVersion,
    //   'createdDate': DateService().format(DateTime.now())
    // };
    // String encryptedJson =
    //     Encryption.encryptObject(jsonEncode(requestBody));

    //   try {
    //     final response = await Dio().post(
    //         AppUrl.baseUrl + AppUrl.getAccessTokenUrl,
    //         data: {'Text': encryptedJson});
    //     var decryptedResponse =
    //         Encryption.decryptObject(response.data['Text']);
    //     var jsonResponse = jsonDecode(decryptedResponse);

    //     accountProvider.userDetails!.userDetails.token = jsonResponse['Body'];
    //     handler.resolve(await _getRetryRequest(error));
    //   } catch (e) {
    //     AppState appState = sl();
    //     LoginViewModel loginViewModal = sl();
    //     await loginViewModal.logOut();
    //     sessionTimer!.cancel();
    //     appState.currentAction = PageAction(
    //         state: PageState.replaceAll,
    //         page: PageConfigs.authWrapperPageConfig);
    //     // onErrorMessage?.call(OnErrorMessageModel(message: 'OTP sent!', backgroundColor: Colors.grey));

    //   }
    // } else {

    // }
    handler.next(error);
  }));
}
