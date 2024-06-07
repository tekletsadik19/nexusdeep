import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:nexusdeep/core/errors/exceptions.dart';
import 'package:nexusdeep/core/errors/failure.dart';
import 'package:nexusdeep/core/utils/typedef.dart';
import 'package:nexusdeep/features/proposal/data/data_source/financial_institute_data_source.dart';
import 'package:nexusdeep/features/proposal/domain/entity/fianancial_institute.dart';
import 'package:nexusdeep/features/proposal/domain/repos/financial_institution_repos.dart';

class FinancialInstituteRepoImpl implements FinancialInstituteRepos {

  FinancialInstituteRepoImpl(this.dataSource);
  final FinancialInstituteDataSource dataSource;

  @override
  ResultFuture<FinancialInstitute> getFinancialInstituteById(String id) async {
    try {
      final result = await dataSource.getFinancialInstituteById(id);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<List<FinancialInstitute>> getFinancialInstitutesByInvestmentCount() async {
    try {
      final result = await dataSource.getFinancialInstitutesByInvestmentCount();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<List<FinancialInstitute>> getAllFinancialInstitutes() async {
    try {
      final result = await dataSource.getAllFinancialInstitutes();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<List<FinancialInstitute>> getTopFinancialInstitutesByDealCount() async {

    try {
      final result = await dataSource.getTopFinancialInstitutesByDealCount();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<List<FinancialInstitute>> getFinancialInstitutesByDealCount() async {
    try {
      final result = await dataSource.getFinancialInstitutesByDealCount();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }
}
