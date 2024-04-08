import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nexusdeep/core/enum/user/update_user.dart';
import 'package:nexusdeep/features/auth/domain/entities/user.dart';
import 'package:nexusdeep/features/auth/domain/repos/auth_repos.dart';
import 'package:nexusdeep/features/auth/domain/usecase/update_user.dart';


import 'auth_repo.mock.dart';

void main() {
  late AuthenticationRepository authRepo;
  late UpdateUser updateUser;

  final tUserData = LocalUser.empty();
  const tAction = UpdateUserAction.email;

  setUp(() {
    authRepo = MockAuthRepo();
    updateUser = UpdateUser(authRepo);
  });

  test(
      'should call [AuthRepo.updateUser] '
      'and return the right data', () async {
    when(
      () => authRepo.updateUser(
        action: UpdateUserAction.email,
        userData: any(named: 'userData'),
      ),
    ).thenAnswer((_) async => const Right(null));
    final result = await updateUser(
      UpdateUserParams(action: tAction, userData: tUserData),
    );

    expect(
      result,
      equals(
        const Right<dynamic, void>(null),
      ),
    );
    verify(
      () => authRepo.updateUser(action: tAction, userData: tUserData),
    ).called(1);
    verifyNoMoreInteractions(authRepo);
  });
}
