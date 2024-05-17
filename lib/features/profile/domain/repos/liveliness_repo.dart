import 'package:nexusdeep/core/utils/typedef.dart';
import 'package:nexusdeep/features/profile/domain/entity/liveliness.dart';

abstract class LivelinessRepository {
  ResultFuture<bool> checkLiveliness(LivelinessParams params);
  ResultFuture<bool> getUserFacialInfo(LivelinessParams params);
}