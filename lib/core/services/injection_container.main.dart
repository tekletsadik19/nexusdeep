part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final prefs = await SharedPreferences.getInstance();
  sl
    ..registerLazySingleton(() => prefs)
    ..registerLazySingleton(() => UserSession(prefs))
    ..registerLazySingleton(
      () =>
          CustomHttpClient(sl.get<SharedPreferences>(), sl.get<UserSession>()),
    );

  if (!prefs.containsKey(kFirstTimerKey)) {
    await prefs.setBool(kFirstTimerKey, true);
  }

  Get
    ..put(sl.get<UserSession>())
    ..put(sl.get<CustomHttpClient>());
  await _onBoardingInit();
  await CoreTheme.initialize();
  await _authInit();
  await _profileInit();
  await _financialInstituteInit();
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
    );
}

Future<void> _authInit() async {
  final prefs = await SharedPreferences.getInstance();
  sl
    ..registerFactory(
      () => AuthBloc(
        signIn: sl(),
        signUp: sl(),
        updateUser: sl(),
        forgotPassword: sl(),
        logout: sl(),
        verifyEmail: sl(),
        signInWithGoogle: sl(),
        signInWithFacebook: sl(),
      ),
    )
    ..registerLazySingleton(() => SignIn(sl()))
    ..registerLazySingleton(() => SignUp(sl()))
    ..registerLazySingleton(() => VerifyEmail(sl()))
    ..registerLazySingleton(() => ForgotPassword(sl()))
    ..registerLazySingleton(() => UpdateUser(sl()))
    ..registerLazySingleton(() => LogoutUseCase(sl()))
    ..registerLazySingleton(() => SignInWithGoogle(sl()))
    ..registerLazySingleton(() => SignInWithFacebook(sl()))
    ..registerLazySingleton<AuthenticationRepository>(() => AuthRepoImpl(sl()))
    ..registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        googleSignIn: sl(),
        facebookAuthClient: sl(),
        prefs: sl(),
        httpClient: sl(),
        userSession: sl(),
      ),
    )
    ..registerLazySingleton<GoogleSignIn>(GoogleSignIn.new)
    ..registerLazySingleton(() => FacebookAuth.instance);
}

Future<void> _profileInit() async {
  sl
    ..registerFactory(
      () => ProfileBloc(
        scanDigitalId: sl(),
      ),
    )
    ..registerLazySingleton(
      () => ScanDigitalId(
        sl(),
      ),
    )
    ..registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(
        sl(),
      ),
    )
    ..registerLazySingleton<ProfileRemoteDataSource>(
      ProfileRemoteDataSourceImpl.new,
    )
    ..registerFactory(
      () => LivelinessCubit(
        checkLiveliness: sl(),
        getUserFacialInfo: sl(),
      ),
    )
    ..registerLazySingleton(() => CheckLiveliness(sl()))
    ..registerLazySingleton(() => GetUserFacialInfo(sl()))
    ..registerLazySingleton<LivelinessLocalDataSource>(
      LivelinessLocalDataSourceImpl.new,
    )
    ..registerLazySingleton<LivelinessRepository>(
      () => LivelinessRepositoryImpl(sl()),
    );
}

Future<void> _financialInstituteInit() async {
  sl
    ..registerFactory(
      () => FinancialInstituteBloc(
        getAllFinancialInstitutes: sl(),
        getFinancialInstituteById: sl(),
        getFinancialInstitutesByDealCount: sl(),
        getTopFinancialInstitutesByDealCount: sl(),
        getFinancialInstitutesByInvestmentCount: sl(),
      ),
    )
    ..registerLazySingleton(() => GetAllFinancialInstitutes(sl()))
    ..registerLazySingleton(() => GetFinancialInstituteById(sl()))
    ..registerLazySingleton(() => GetFinancialInstitutesByDealCount(sl()))
    ..registerLazySingleton(() => GetTopFinancialInstitutesByDealCount(sl()))
    ..registerLazySingleton(() => GetFinancialInstitutesByInvestmentCount(sl()))

    ..registerLazySingleton<FinancialInstituteRepos>(
      () => FinancialInstituteRepoImpl(
        sl(),
      ),
    )
    ..registerLazySingleton<FinancialInstituteDataSource>(
      () => FinancialInstituteDataSourceImpl(userSession: sl(),prefs: sl()),
    );
}
