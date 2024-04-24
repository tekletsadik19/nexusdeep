import 'package:dartz/dartz.dart';
import 'package:nexusdeep/core/enum/user/update_user.dart';
import 'package:nexusdeep/core/errors/exceptions.dart';
import 'package:nexusdeep/core/errors/failure.dart';
import 'package:nexusdeep/core/utils/typedef.dart';
import 'package:nexusdeep/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:nexusdeep/features/auth/data/models/user_model.dart';
import 'package:nexusdeep/features/auth/domain/repos/auth_repos.dart';

class AuthRepoImpl implements AuthenticationRepository {
  const AuthRepoImpl(this._authRemoteDataSource);

  final AuthRemoteDataSource _authRemoteDataSource;
  @override
  ResultFuture<void> forgotPassword({required String email}) async {
    try {
      await _authRemoteDataSource.forgotPassword(
        email: email,
      );
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<LocalUserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _authRemoteDataSource.signIn(
        email: email,
        password:password,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await _authRemoteDataSource.signUp(
        name: name,
        email: email,
        password: password,
      );
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<void> verifyEmail({required String code}) async{
    try {
      await _authRemoteDataSource.verifyEmail(
        code: code,
      );
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }


  @override
  ResultFuture<void> updateUser({
    required UpdateUserAction action,
    required dynamic userData,
  }) async {
    try {
      await _authRemoteDataSource.updateUser(
        action: action,
        userData: userData,
      );
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }


  @override
  ResultFuture<void> logout() async {
    try {
      await _authRemoteDataSource.logout();
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }



}
