import 'package:nexusdeep/core/usecase/usecase.dart';
import 'package:nexusdeep/core/utils/typedef.dart';
import 'package:nexusdeep/features/auth/domain/repos/auth_repos.dart';

class LogoutUseCase extends UsecaseWithoutParams<void>{
  LogoutUseCase(this.repository);
  final AuthenticationRepository repository;

  @override
  ResultFuture call() async {
    return repository.logout();
  }
}
