import 'package:equatable/equatable.dart';
import 'package:nexusdeep/core/usecase/usecase.dart';
import 'package:nexusdeep/core/utils/typedef.dart';
import 'package:nexusdeep/features/auth/domain/repos/auth_repos.dart';

class VerifyEmail extends UsecaseWithParams<void, VerifyEmailParams> {
  const VerifyEmail(this._authRepo);
  final AuthenticationRepository _authRepo;

  @override
  ResultFuture<void> call(VerifyEmailParams params) => _authRepo.verifyEmail(
        code: params.code,
        token:params.token
  );
}


class VerifyEmailParams extends Equatable{

  const VerifyEmailParams({
    required this.code,
    required this.token,
  });

  const VerifyEmailParams.empty():this(
    code:'',
    token:'',
  );

  final String code;
  final String token;


  @override
  List<Object?> get props => [code,token];
}
