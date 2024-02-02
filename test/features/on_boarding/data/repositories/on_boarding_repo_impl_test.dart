import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nexusdeep/core/errors/exceptions.dart';
import 'package:nexusdeep/core/errors/failure.dart';
import 'package:nexusdeep/features/on_boarding/data/datasources/on_boarding_local_datasource.dart';
import 'package:nexusdeep/features/on_boarding/data/repositories/on_boarding_repo_impl.dart';

class MockOnBoardingLocalDataSrc extends Mock
    implements OnBoardingLocalDataSource {}

void main() {
  late OnBoardingLocalDataSource localDataSource;
  late OnBoardingRepoImpl repoImpl;
  setUp(() {
    localDataSource = MockOnBoardingLocalDataSrc();
    repoImpl = OnBoardingRepoImpl(localDataSource);
  });

  group('cachedFirstTimer', () {
    test('should complete successfully', () async {
      when(() => localDataSource.cacheFirstTimer())
          .thenAnswer((_) async => Future.value());
      final result = await repoImpl.cacheFirstTimer();
      expect(result, equals(const Right<dynamic, void>(null)));
      verify(() => localDataSource.cacheFirstTimer());
      verifyNoMoreInteractions(localDataSource);
    });
    test('should return [cacheFailure] when failure occure to local datasource',
        () async {
      when(() => localDataSource.cacheFirstTimer())
          .thenThrow(const CacheException(message: 'Insufficient Storage'));
      final result = await repoImpl.cacheFirstTimer();
      expect(
        result,
        equals(
          Left<CacheFailure, dynamic>(
            CacheFailure(message: 'Insufficient Storage', statusCode: 500),
          ),
        ),
      );
      verify(() => localDataSource.cacheFirstTimer());
      verifyNoMoreInteractions(localDataSource);
    });
  });
  group('checkIfUserIsFirstTimer', () {
    test('should return true when user is first timer', () async {
      when(() => localDataSource.checkIfUserIsFirstTimer()).thenAnswer(
        (_) async => Future.value(true),
      );
      final result = await repoImpl.checkIfUserIsFirstTimer();
      expect(result, equals(const Right<bool,dynamic>(true)));
      verify(()=>localDataSource.checkIfUserIsFirstTimer()).called(1);
      verifyNoMoreInteractions(localDataSource);
    });
    test('should return false when user is not first timer', () async {
      when(() => localDataSource.checkIfUserIsFirstTimer()).thenAnswer(
            (_) async => Future.value(false),
      );
      final result = await repoImpl.checkIfUserIsFirstTimer();
      expect(result, equals(const Right<bool,dynamic>(false)));
      verify(()=>localDataSource.checkIfUserIsFirstTimer()).called(1);
      verifyNoMoreInteractions(localDataSource);
    });
    test('should return [cacheFailure] when failure occur while checking first timer',
            () async {
          when(() => localDataSource.checkIfUserIsFirstTimer())
              .thenThrow(const CacheException(message: 'Insufficient Storage'));
          final result = await repoImpl.checkIfUserIsFirstTimer();
          expect(
            result,
            equals(
              Left<CacheFailure, dynamic>(
                CacheFailure(message: 'Insufficient Storage', statusCode: 500),
              ),
            ),
          );
          verify(() => localDataSource.checkIfUserIsFirstTimer());
          verifyNoMoreInteractions(localDataSource);
        });
  });
}
