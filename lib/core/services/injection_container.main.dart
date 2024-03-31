part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await _onBoardingInit();
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
