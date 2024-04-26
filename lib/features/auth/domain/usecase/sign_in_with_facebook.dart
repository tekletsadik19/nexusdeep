import 'package:nexusdeep/core/usecase/usecase.dart';
import 'package:nexusdeep/core/utils/typedef.dart';
import 'package:nexusdeep/features/auth/domain/entities/user.dart';
import 'package:nexusdeep/features/auth/domain/repos/auth_repos.dart';

class SignInWithFacebook extends UsecaseWithoutParams<LocalUser> {

  SignInWithFacebook(this._authRepo);
  final AuthenticationRepository _authRepo;

  @override
  ResultFuture<LocalUser> call() => _authRepo.signInWithFacebook();
}
