import 'package:dartz/dartz.dart';
import 'package:nexusdeep/core/errors/exceptions.dart';
import 'package:nexusdeep/core/errors/failure.dart';
import 'package:nexusdeep/core/utils/typedef.dart';
import 'package:nexusdeep/features/profile/data/data_sources/liveliness_local_datasource.dart';
import 'package:nexusdeep/features/profile/domain/entity/liveliness.dart';
import 'package:nexusdeep/features/profile/domain/repos/liveliness_repo.dart';

class LivelinessRepositoryImpl implements LivelinessRepository {

  LivelinessRepositoryImpl(this.localDataSource);
  final LivelinessLocalDataSource localDataSource;

  @override
  ResultFuture<bool> checkLiveliness(LivelinessParams params) async {
    try {
      final result = await localDataSource.checkLiveliness(params);
      return Right(result);
    } on LivelinessException catch (e) {
      return Left(LivelinessFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<bool> getUserFacialInfo(LivelinessParams params) async {
    try {
      final result = await localDataSource.getUserFacialInfo(params);
      return Right(result);
    } on LivelinessException catch (e) {
      return Left(LivelinessFailure(message: e.message, statusCode: e.statusCode));
    }
  }
}