import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:logger/logger.dart';
import 'package:sb_myreports/core/router/app_state.dart';
import 'package:sb_myreports/core/router/models/page_config.dart';
import 'package:sb_myreports/core/utils/enums/page_state_enum.dart';
import 'package:sb_myreports/core/utils/services/secure_storage_service.dart';
import 'package:sb_myreports/features/authentication/login/domain/usecases/login_usecase.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/utils/globals/globals.dart';
import '../../../../../core/utils/globals/snack_bar.dart';
import '../../data/models/login_request_model.dart';
import '../../data/models/login_response_modal.dart';
import '../../data/models/sign_up_request_model.dart';
import '../../data/models/sign_up_response_model.dart';
import '../../domain/usecases/sign_up_usecase.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider(this._loginUsecase, this._signupUsecase);
  // vars
  SecureStorageService secureStorageService = SecureStorageService();
  // Response Models
  LoginResponseModel? loginResponseModel;
  SignupResponseModel? signupResponseModel;
  //usecases
  final LoginUseCase _loginUsecase;
  final SignupUsecase _signupUsecase;

  //valuenotifiers

  ValueNotifier<bool> loginLoading = ValueNotifier(false);
  ValueNotifier<bool> signupLoading = ValueNotifier(false);

  //usecases calls
  Future<void> loginUser(String email, String password) async {
    loginLoading.value = true;
    final params = LoginRequestModel(email: email, password: password);
    Logger().v(params.toJson());
    var loginEither = await _loginUsecase(params);
    if (loginEither.isLeft()) {
      handleError(loginEither);
      loginLoading.value = false;
    } else if (loginEither.isRight()) {
      loginEither.foldRight(null, (response, previous) async {
        loginLoading.value = false;
        loginResponseModel = response;
        Logger().e(response.toJson());
        changeUserDetails(response);
        AppState state = sl();
        state.goToNext(PageConfigs.dashboardPageConfig,
            pageState: PageState.replaceAll);
      });
    }
  }

  Future<void> signupUser(
      String firstName,
      String lastName,
      String mobile,
      String cnic,
      String dob,
      String email,
      String city,
      String university,
      String address,
      String password) async {
    signupLoading.value = true;
    final params = SignupRequestModel(
      firstName: firstName,
      city: city,
      address: address,
      cnic: cnic,
      dob: dob,
      lastName: lastName,
      universityOrCollege: university,
      phone: mobile,
      email: email,
      role: "user",
      password: password,
      confirmPassword: password,
    );
    var signupEither = await _signupUsecase(params);
    if (signupEither.isLeft()) {
      handleError(signupEither);
      signupLoading.value = false;
    } else if (signupEither.isRight()) {
      signupEither.foldRight(null, (response, previous) async {
        signupLoading.value = false;
        signupResponseModel = response;
        AppState state = sl();
        state.goToNext(PageConfigs.dashboardPageConfig,
            pageState: PageState.replaceAll);
      });
    }
  }

  /// Login using local auth
  Future<void> loginWithLocalAuth() async {
    try {
      String? credentials = await secureStorageService.getLoginCredentials();
      if (credentials == null) {
        return ShowSnackBar.show(
            "Please Login first in order to use login with Fingerprint/Face-id");
      }
      final LocalAuthentication auth = LocalAuthentication();
      final bool didAuthenticate = await auth.authenticate(
          // options: const AuthenticationOptions(biometricOnly: true),
          localizedReason: 'Please authenticate to login');
      if (didAuthenticate) {
        /// authenticated and credentials available
        if (credentials != null) {
          loginResponseModel = LoginResponseModel.fromJson(
              json.decode(credentials) as Map<String, dynamic>);
          ShowSnackBar.show("Logged in successfully ");
          print(loginResponseModel!.user!.toJson());
          // WalletProvider walletProvider = sl();
          // if (currentUser!.data!.zindigiWallet?.linked ?? false) {
          //   walletProvider.getWalletInfo();
          // }
          AppState state = sl();
          state.goToNext(PageConfigs.dashboardPageConfig,
              pageState: PageState.replaceAll);
        } else {
          /// no credentials found
          ShowSnackBar.show(
              "Please Login first in order to use login with Fingerprint/Face-id");
        }
      } else {}
    } catch (e) {
      ShowSnackBar.show("Sorry an error Occurred during authentication");
    }
  }

  /// change current user details and notifies the Ui
  /// and save it in local storage
  changeUserDetails(LoginResponseModel userData) {
    loginResponseModel = userData;
    saveLoginCredentialsLocally(userData.toJson());
    notifyListeners();
  }

  /// SAVES user [LoginUserResponseModel] locally that is available
  /// for local auth login in [loginWithLocalAuth]
  saveLoginCredentialsLocally(Map<String, dynamic> data) {
    String credentials = jsonEncode(data);
    secureStorageService.setLoginCredentials(credentials);
  }

  // Error Handling
  void handleError(Either<Failure, dynamic> either) {
    either.fold((l) => ShowSnackBar.show(l.message), (r) => null);
  }
}
