import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nexusdeep/core/errors/failure.dart';
import 'package:nexusdeep/features/on_boarding/domain/repos/on_boarding_repo.dart';
import 'package:nexusdeep/features/on_boarding/domain/usecases/cache_first_timer.dart';


import 'on_boarding_repo.mock_test.dart';

void main() {
  late OnBoardingRepo repo;
  late CacheFirstTimer usecase;

  setUp(() {
    repo = MockOnBoardingRepo();
    usecase = CacheFirstTimer(repo);
  });

  test(
    'should call [OnBoarding.cacheFirstTimer] '
    'and return the right data',
    () async {
      when(()=>repo.cacheFirstTimer()).thenAnswer(
              (_)async => Left(ServerFailure(message: 'unknown error occurred',
                  statusCode: 500,
              ),),
      );
      final result = await usecase();
      expect(result, Left<Failure,dynamic>(
          ServerFailure(message: 'unknown error occurred',statusCode: 500)));
      verify(()=> repo.cacheFirstTimer()).called(1);
      verifyNoMoreInteractions(repo);
    },
  );
}
