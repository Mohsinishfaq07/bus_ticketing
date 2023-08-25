import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sb_myreports/features/dashboard/data/data_sources/ticket_remote_data_source.dart';
import 'package:sb_myreports/features/authentication/login/data/repository/auth_repo_imp.dart';
import 'package:sb_myreports/features/authentication/login/domain/repository/auth_repo.dart';
import 'package:sb_myreports/features/authentication/login/domain/usecases/login_usecase.dart';
import 'package:sb_myreports/features/authentication/login/presentation/manager/auth_provider.dart';
import 'package:sb_myreports/features/dashboard/domain/usecases/get_user_card_details_usecase.dart';
import 'package:sb_myreports/features/dashboard/domain/usecases/get_user_history_usercase.dart';

import 'core/router/app_state.dart';
import 'core/utils/globals/globals.dart';
import 'core/utils/network/network_info.dart';
import 'features/authentication/login/data/data_sources/auth_remote_data_source.dart';
import 'features/authentication/login/domain/usecases/sign_up_usecase.dart';
import 'features/dashboard/data/data_sources/user_queries_remote_data_source.dart';
import 'features/dashboard/data/repository/ticket_repo_imp.dart';
import 'features/dashboard/data/repository/user_queries_repo_imp.dart';
import 'features/dashboard/domain/repository/ticket_repo.dart';
import 'features/dashboard/domain/repository/user_queries_repo.dart';
import 'features/dashboard/domain/usecases/link_card_usecase.dart';
import 'features/dashboard/presentation/manager/dashboard_provider.dart';
import 'features/dashboard/presentation/manager/ticket_provider.dart';
import 'features/dashboard/presentation/manager/user_queries_provider.dart';

Future<void> init() async {
  /// UseCases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => LinkCardUsecase(sl()));
  sl.registerLazySingleton(() => SignupUsecase(sl()));
  sl.registerLazySingleton(() => GetUserHistoryUsecase(sl()));
  sl.registerLazySingleton(() => GetUserCardDetailsUsecase(sl()));

  // sl.registerLazySingleton(() => GetRandomJokeUsecase(sl()));

  //Repositories
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImp(dio: sl()));
  sl.registerLazySingleton<UserQueriesRemoteDataSource>(
      () => UserQueriesRemoteDataSourceImp(dio: sl()));

  // sl.registerLazySingleton<JokeRepository>(
  //   () => JokesRepoImp(remoteDataSource: sl(), networkInfo: sl()),
  // );

  //Data sources
  sl.registerLazySingleton<TicketRemoteDataSource>(
      () => TicketRemoteDataSourceImp(dio: sl()));

  /// Configs

  /// Repository
  sl.registerLazySingleton<AuthRepository>(
      () => LoginRepoImp(networkInfo: sl(), remoteDataSource: sl()));
  sl.registerLazySingleton<UserQueriesRepository>(
      () => UserQueriesRepoImp(networkInfo: sl(), remoteDataSource: sl()));
  sl.registerLazySingleton<TicketRepository>(
      () => TicketRepoImp(networkInfo: sl(), remoteDataSource: sl()));

  /// External
  sl.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());

  /// Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  /// Providers
  ///
  sl.registerLazySingleton(() => AuthProvider(sl(), sl()));
  sl.registerLazySingleton(() => DashboardProvider());
  sl.registerLazySingleton(() => UserQueriesProvider(sl(), sl(), sl(), sl()));
  sl.registerLazySingleton(() => TicketProvider(sl(), sl()));
  // sl.registerLazySingleton(() => JokesProvider(sl(), sl()));
  sl.registerLazySingleton(() => Dio());

  /// Navigator
  sl.registerLazySingleton(() => AppState());
}
