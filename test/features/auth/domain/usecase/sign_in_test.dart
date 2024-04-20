import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nexusdeep/features/auth/domain/entities/user.dart';
import 'package:nexusdeep/features/auth/domain/repos/auth_repos.dart';
import 'package:nexusdeep/features/auth/domain/usecase/sign_in.dart';

import 'auth_repo.mock.dart';

void main() {
  late AuthenticationRepository authRepo;
  late SignIn signIn;

  const tEmail = 'Test Email';
  const tPassword = 'Test Password';
  final tUser = const LocalUser.empty();

  setUp(() {
    authRepo = MockAuthRepo();
    signIn = SignIn(authRepo);
  });

  test(
      'should call [AuthRepo.signIn] '
      'and return the right data', () async {
    when(
      () => authRepo.signIn(
        email: any(named: 'email'),
        password: any(named: 'password'),
      ),
    ).thenAnswer((_) async => Right(tUser));
    final result = await signIn(
      const SignInParams(
        email: tEmail,
        password: tPassword,
      ),
    );
    expect(result, equals(Right<LocalUser, dynamic>(tUser)));
    verify(() => authRepo.signIn(
          email: tEmail,
          password: tPassword,
        ),
    ).called(1);
    verifyNoMoreInteractions(authRepo);
  });
}
