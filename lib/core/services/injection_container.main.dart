part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await _onBoardingInit();
  await _authInit();
}

Future<void> _onBoardingInit() async {
  final prefs = await SharedPreferences.getInstance();
  // Register OnBoarding
  // Business Logic
  sl
    ..registerFactory(
          () => OnBoardingCubit(
        cacheFirstTimer: sl(),
        checkIfUserFirstTimer: sl(),
      ),
    )
    ..registerLazySingleton(() => CacheFirstTimer(sl()))
    ..registerLazySingleton(() => CheckIfUserFirstTimer(sl()))
    ..registerLazySingleton<OnBoardingRepo>(() => OnBoardingRepoImpl(sl()))
    ..registerLazySingleton<OnBoardingLocalDataSource>(
          () => OnBoardingLocalDataSourceImpl(sl()),
    )
    ..registerLazySingleton(() => prefs);
}

Future<void> _authInit() async {
  sl
    ..registerFactory(
          () => AuthBloc(
        signIn: sl(),
        signUp: sl(),
        updateUser: sl(),
        forgotPassword: sl(),
        logout: sl(),
      ),
    )
    ..registerLazySingleton(() => SignIn(sl()))
    ..registerLazySingleton(() => SignUp(sl()))
    ..registerLazySingleton(() => ForgotPassword(sl()))
    ..registerLazySingleton(() => UpdateUser(sl()))
    ..registerLazySingleton(() => LogoutUseCase(sl()))
    ..registerLazySingleton<AuthenticationRepository>(() => AuthRepoImpl(sl()))
    ..registerLazySingleton<AuthRemoteDataSource>(
          () => AuthRemoteDataSourceImpl(),
    );
}
