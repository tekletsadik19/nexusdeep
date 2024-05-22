import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:nexusdeep/core/errors/exceptions.dart';
import 'package:nexusdeep/core/errors/failure.dart';
import 'package:nexusdeep/core/utils/typedef.dart';
import 'package:nexusdeep/features/profile/data/data_sources/profile_data_source.dart';
import 'package:nexusdeep/features/profile/domain/entity/scan_result.dart';
import 'package:nexusdeep/features/profile/domain/repos/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  const ProfileRepositoryImpl(this._profileRemoteDataSource);

  final ProfileRemoteDataSource _profileRemoteDataSource;
  @override
  ResultFuture<ScanResult> scanPassport({
    required File firstPage,
  }) async {
    try {
      final result = await _profileRemoteDataSource.scanPassport(
        firstPage: firstPage,
      );
      return Right(result);
    } on ScanDataException catch (e) {
      return Left(ScanDataFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<ScanResult> scanDigitalId({
    required File front,
    required File back,
  }) async {
    try {
      final result = await _profileRemoteDataSource.scanDigitalId(
        front: front,
        back: back,
      );
      return Right(result);
    } on ScanDataException catch (e) {
      return Left(ScanDataFailure(message: e.message, statusCode: e.statusCode));
    }
  }
}
