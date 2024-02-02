import 'package:nexusdeep/core/usecase/usecase.dart';
import 'package:nexusdeep/core/utils/typedef.dart';
import 'package:nexusdeep/features/on_boarding/domain/repos/on_boarding_repo.dart';

class CacheFirstTimer extends UsecaseWithoutParams<void>{
  const CacheFirstTimer(this._repo);
  final OnBoardingRepo _repo;
  @override
  ResultFuture<void> call() async => _repo.cacheFirstTimer();
}
