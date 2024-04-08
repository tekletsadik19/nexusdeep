import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nexusdeep/core/errors/failure.dart';
import 'package:nexusdeep/features/auth/domain/repos/auth_repos.dart';
import 'package:nexusdeep/features/auth/domain/usecase/forgot_password.dart';


import 'auth_repo.mock.dart';

void main() {
  late ForgotPassword forgotPassword;
  late AuthenticationRepository authRepo;

  const tEmail = 'TestEmail';

  setUp(()=>{
    authRepo = MockAuthRepo(),
    forgotPassword = ForgotPassword(authRepo)
  },);


  test(
    'should call [AuthRepo.forgotPassword] '
        'and return the right data',
        () async {
      when(()=>authRepo.forgotPassword(email: any(named: 'email'))).thenAnswer(
              (_)async => Left(ServerFailure(message: 'unknown error occurred',
                statusCode: 500,),),
      );
      final result = await forgotPassword(tEmail);
      expect(result, Left<Failure,dynamic>(
          ServerFailure(message: 'unknown error occurred',statusCode: 500),),);
      verify(()=> authRepo.forgotPassword(email: tEmail)).called(1);
      verifyNoMoreInteractions(authRepo);
    },
  );
}
