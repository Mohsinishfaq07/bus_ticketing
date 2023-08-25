import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:sb_myreports/core/modals/no_params.dart';
import 'package:sb_myreports/features/authentication/login/presentation/manager/auth_provider.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/globals/snack_bar.dart';
import '../../data/modals/get_user_history_reaponse_model.dart';
import '../../domain/usecases/get_user_history_usercase.dart';

class TicketProvider extends ChangeNotifier {
  TicketProvider(
    this._getUserHistoryUsecase,
    this.authProvider,
  );

  /// others
  bool isTicketGenerated = false;
  final AuthProvider authProvider;
  // Response Models

  GetUserHistoryResponseModel? getUserHistoryResponseModel;

  // Use cases
  final GetUserHistoryUsecase _getUserHistoryUsecase;

  // Loaders
  ValueNotifier<bool> getUserHistoryLoading = ValueNotifier(false);

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

  clearDetails() {
    isTicketGenerated = false;
    notifyListeners();
  }

  // Error Handling
  void handleError(Either<Failure, dynamic> either) {
    either.fold((l) => ShowSnackBar.show(l.message), (r) => null);
  }
}
