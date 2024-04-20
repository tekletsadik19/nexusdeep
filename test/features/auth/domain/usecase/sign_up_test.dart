import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nexusdeep/features/auth/domain/repos/auth_repos.dart';
import 'package:nexusdeep/features/auth/domain/usecase/sign_up.dart';


import 'auth_repo.mock.dart';

void main() {
  late AuthenticationRepository authRepo;
  late SignUp signUp;

  const tEmail = 'Test Email';
  const tName = 'Test Name';
  const tPassword = 'Test Password';
  const tPhoneNumber = 'Test Phone Number';
  const tProfilePic = 'Test Profile Picture';
  const tInvitationCode = 'Test Invitation Code';

  setUp(() {
    authRepo = MockAuthRepo();
    signUp = SignUp(authRepo);
  });

  test(
      'should call [AuthRepo.signUp] '
      'and return the right data', () async {
    when(
      () => authRepo.signUp(
        name: any(named: 'name'),
        email: any(named: 'email'),

        password: any(named: 'password'),
      ),
    ).thenAnswer((_) async => const Right(null));
    final result = await signUp(
        const SignUpParams(
          name: tName,
          email: tEmail,
          password: tPassword,
        ),
    );
    
    expect(result, equals(
      const Right<dynamic,void>(null),
    ),);
    
    verify(()=>authRepo.signUp(
      name: tName,
      email: tEmail,
      password: tPassword,),).called(1);
    verifyNoMoreInteractions(authRepo);
    
  });
}
