import 'package:equatable/equatable.dart';
import 'package:nexusdeep/core/usecase/usecase.dart';
import 'package:nexusdeep/core/utils/typedef.dart';
import 'package:nexusdeep/features/auth/domain/repos/auth_repos.dart';

class VerifyEmail extends UsecaseWithParams<void, String> {
  const VerifyEmail(this._authRepo);
  final AuthenticationRepository _authRepo;

  @override
  ResultFuture<void> call(String params) => _authRepo.verifyEmail(
        code: params,
  );
}
