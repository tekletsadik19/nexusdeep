import 'package:nexusdeep/core/usecase/usecase.dart';
import 'package:nexusdeep/core/utils/typedef.dart';
import 'package:nexusdeep/features/profile/domain/entity/liveliness.dart';
import 'package:nexusdeep/features/profile/domain/repos/liveliness_repo.dart';

class CheckLiveliness extends UsecaseWithParams<bool, LivelinessParams> {

  CheckLiveliness(this.repository);
  final LivelinessRepository repository;

  @override
  ResultFuture<bool> call(LivelinessParams params) {
    return repository.checkLiveliness(params);
  }
}