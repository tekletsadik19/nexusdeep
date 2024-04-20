import 'package:nexusdeep/core/enum/user/update_user.dart';
import 'package:nexusdeep/core/utils/typedef.dart';
import 'package:nexusdeep/features/auth/domain/entities/user.dart';

abstract class AuthenticationRepository{
  const AuthenticationRepository();

  ResultFuture<void> forgotPassword({
    required String email,
  });

  ResultFuture<LocalUser> signIn({
    required String email,
    required String password,
  });


  ResultFuture<void> signUp({
    required String name,
    required String email,
    required String password,
  });

  ResultFuture<void> updateUser({
    required UpdateUserAction action,
    required dynamic userData,
  });

  ResultFuture<void> logout();
}
