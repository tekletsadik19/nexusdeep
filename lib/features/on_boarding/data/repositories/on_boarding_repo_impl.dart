import 'package:dartz/dartz.dart';
import 'package:nexusdeep/core/errors/exceptions.dart';
import 'package:nexusdeep/core/errors/failure.dart';
import 'package:nexusdeep/core/utils/typedef.dart';
import 'package:nexusdeep/features/on_boarding/data/datasources/on_boarding_local_datasource.dart';
import 'package:nexusdeep/features/on_boarding/domain/repos/on_boarding_repo.dart';

class OnBoardingRepoImpl implements OnBoardingRepo{
  const OnBoardingRepoImpl(this._localDataSource);

  final OnBoardingLocalDataSource _localDataSource;

  @override
  ResultFuture<void> cacheFirstTimer() async {
    try{
      await _localDataSource.cacheFirstTimer();
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message,statusCode:e.statusCode));
    }
  }

  @override
  ResultFuture<bool> checkIfUserIsFirstTimer() async {
    try{
      final result = await _localDataSource.checkIfUserIsFirstTimer();
      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message,statusCode:e.statusCode));
    }
  }

}