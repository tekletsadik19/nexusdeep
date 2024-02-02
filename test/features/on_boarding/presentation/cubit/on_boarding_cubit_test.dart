import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nexusdeep/core/errors/failure.dart';
import 'package:nexusdeep/features/on_boarding/domain/usecases/cache_first_timer.dart';
import 'package:nexusdeep/features/on_boarding/domain/usecases/check_if_user_first_timer.dart';
import 'package:nexusdeep/features/on_boarding/presentation/cubit/on_boarding_cubit.dart';

class MockCacheFirstTimer extends Mock implements CacheFirstTimer {}

class MockCheckIfFirstTimer extends Mock implements CheckIfUserFirstTimer {}

void main() {
  late CacheFirstTimer cacheFirstTimer;
  late CheckIfUserFirstTimer checkIfUserFirstTimer;
  late OnBoardingCubit cubit;
  setUp(() {
    cacheFirstTimer = MockCacheFirstTimer();
    checkIfUserFirstTimer = MockCheckIfFirstTimer();
    cubit = OnBoardingCubit(
        cacheFirstTimer: cacheFirstTimer,
        checkIfUserFirstTimer: checkIfUserFirstTimer);
  });
  final tFailure = CacheFailure(message: 'Insufficient Storage Permission', statusCode: 4032);
  test('initial state should be [OnBoardingInitial] state', () {
    expect(cubit.state, const OnBoardingInitial());
  });
  group("cacheFirstTimer", () {
    blocTest<OnBoardingCubit, OnBoardingState>(
        'should emit [CacheFirstTimer, UserCached] when successful',
        build: () {
          when(() => cacheFirstTimer())
              .thenAnswer((_) async => const Right(null));
          return cubit;
        },
        act: (cubit) => cubit.cacheFirstTimer(),
        expect: () => const [CachingFirstTimer(), UserCached()],
        verify: (_) {
          verify(() => cacheFirstTimer()).called(1);
          verifyNoMoreInteractions(cacheFirstTimer);
        }
    );
    blocTest<OnBoardingCubit, OnBoardingState>(
        'should emit [CacheFirstTimer, OnBoardingError] when unsuccessful',
        build: () {
          when(() => cacheFirstTimer()).thenAnswer(
            (_) async => Left(
              tFailure,
            ),
          );
          return cubit;
        },
        act: (cubit)=>cubit.cacheFirstTimer(),
        expect: ()=>[
          CachingFirstTimer(),
          OnBoardingError(tFailure.errorMessage)
        ],
        verify: (_){
          verify(()=>cacheFirstTimer()).called(1);
          verifyNoMoreInteractions(cacheFirstTimer);
        }
    );
  });
  group('checkIfFirstTimer', () {
    blocTest<OnBoardingCubit, OnBoardingState>(
        'should emit [CheckIfUserIsFirstTimer, OnBoardingStatus] when successful',
        build: () {
          when(() => checkIfUserFirstTimer())
              .thenAnswer((_) async => const Right(false));
          return cubit;
        },
        act: (cubit)=>cubit.checkIfUserFirstTimer(),
        expect: ()=>[
          const CheckIfUserIsFirstTimer(),
          const OnBoardingStatus(isFirstTimer: false),
        ],
        verify: (_){
          verify(()=>checkIfUserFirstTimer()).called(1);
          verifyNoMoreInteractions(checkIfUserFirstTimer);
        }
    );
    blocTest<OnBoardingCubit, OnBoardingState>(
      'should emit [CheckIfUserIsFirstTimer, OnBoardingError] when successful',
      build: () {
        when(() => checkIfUserFirstTimer())
            .thenAnswer((_) async => Left(tFailure));
        return cubit;
      },
      act: (cubit)=>cubit.checkIfUserFirstTimer(),
      expect: ()=>[
        const CheckIfUserIsFirstTimer(),
        const OnBoardingStatus(isFirstTimer: true)
      ],
      verify: (_){
        verify(()=>checkIfUserFirstTimer()).called(1);
        verifyNoMoreInteractions(checkIfUserFirstTimer);
      },
    );
  });
}
