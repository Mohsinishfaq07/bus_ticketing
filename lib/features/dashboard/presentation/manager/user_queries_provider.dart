import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:sb_myreports/core/modals/no_params.dart';
import 'package:sb_myreports/features/authentication/login/presentation/manager/auth_provider.dart';
import 'package:sb_myreports/features/dashboard/data/modals/link_card_request_model.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/globals/snack_bar.dart';
import '../../data/modals/get_user_card_details_response_model.dart';
import '../../data/modals/get_user_history_reaponse_model.dart';
import '../../domain/usecases/get_user_card_details_usecase.dart';
import '../../domain/usecases/get_user_history_usercase.dart';
import '../../domain/usecases/link_card_usecase.dart';

class UserQueriesProvider extends ChangeNotifier {
  UserQueriesProvider(
    this._getUserHistoryUsecase,
    this.authProvider,
    this._linkCardUsecase,
    this._getUserCardDetailsUsecase,
  );

  /// others
  bool isTicketGenerated = false;
  final AuthProvider authProvider;
  // Response Models

  GetUserHistoryResponseModel? getUserHistoryResponseModel;
  GetUserCardDetailsResponseModel? getUserCardDetailsResponseModel;

  // Use cases
  final GetUserHistoryUsecase _getUserHistoryUsecase;
  final GetUserCardDetailsUsecase _getUserCardDetailsUsecase;

  final LinkCardUsecase _linkCardUsecase;

  // Loaders
  ValueNotifier<bool> getUserHistoryLoading = ValueNotifier(false);
  ValueNotifier<bool> linkCardLoading = ValueNotifier(false);
  ValueNotifier<bool> getUserCardDetailsLoading = ValueNotifier(false);

  // use case implementation

  Future<bool> getUserHistory() async {
    getUserHistoryLoading.value = true;
    var loginEither = await _getUserHistoryUsecase(NoParams());
    if (loginEither.isLeft()) {
      handleError(loginEither);
      getUserHistoryLoading.value = false;
    } else if (loginEither.isRight()) {
      return loginEither.foldRight(true, (response, previous) async {
        getUserHistoryLoading.value = false;
        getUserHistoryResponseModel = response;
        isTicketGenerated = true;
        notifyListeners();
        return true;
      });
    }
    return false;
  }

  Future<bool> linkCard(String cardNumber, String cnic) async {
    linkCardLoading.value = true;
    var params = LinkCardRequestModel(cardNumber: cardNumber, cnic: cnic);
    var loginEither = await _linkCardUsecase(params);
    if (loginEither.isLeft()) {
      handleError(loginEither);
      linkCardLoading.value = false;
    } else if (loginEither.isRight()) {
      return loginEither.foldRight(true, (response, previous) async {
        linkCardLoading.value = false;
        isTicketGenerated = true;
        getUserCardDetails();
        notifyListeners();
        return true;
      });
    }
    return false;
  }

  Future<bool> getUserCardDetails() async {
    getUserCardDetailsLoading.value = true;
    var loginEither = await _getUserCardDetailsUsecase(NoParams());
    if (loginEither.isLeft()) {
      handleError(loginEither);
      getUserCardDetailsLoading.value = false;
    } else if (loginEither.isRight()) {
      return loginEither.foldRight(true, (response, previous) async {
        getUserCardDetailsLoading.value = false;
        getUserCardDetailsResponseModel = response;
        isTicketGenerated = true;
        notifyListeners();
        return true;
      });
    }
    return false;
  }

  clearDetails() {
    isTicketGenerated = false;
    notifyListeners();
  }

  // Error Handling
  void handleError(Either<Failure, dynamic> either) {
    either.fold((l) => ShowSnackBar.show(l.message), (r) => null);
  }
}
