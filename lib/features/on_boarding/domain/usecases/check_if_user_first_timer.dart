
import 'package:nexusdeep/core/usecase/usecase.dart';
import 'package:nexusdeep/core/utils/typedef.dart';
import 'package:nexusdeep/features/on_boarding/domain/repos/on_boarding_repo.dart';

class CheckIfUserFirstTimer extends UsecaseWithoutParams<bool>{
  const CheckIfUserFirstTimer(this._repo);
  final OnBoardingRepo _repo;
  @override
  ResultFuture<bool> call() async => _repo.checkIfUserIsFirstTimer();
}
