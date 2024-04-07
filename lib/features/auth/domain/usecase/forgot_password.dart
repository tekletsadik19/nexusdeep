import 'package:nexusdeep/core/usecase/usecase.dart';
import 'package:nexusdeep/core/utils/typedef.dart';
import 'package:nexusdeep/features/auth/domain/repos/auth_repos.dart';

class ForgotPassword extends UsecaseWithParams<void,String>{

  const ForgotPassword(this._authRepo);

  final AuthenticationRepository _authRepo;
  @override
  ResultFuture<void> call(String params) =>
      _authRepo.forgotPassword(email: params);
}
