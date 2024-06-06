import 'package:nexusdeep/core/errors/exceptions.dart';
import 'package:nexusdeep/features/profile/domain/entity/liveliness.dart';

abstract class LivelinessLocalDataSource {
  Future<bool> checkLiveliness(LivelinessParams params);
  Future<bool> getUserFacialInfo(LivelinessParams params);
}

class LivelinessLocalDataSourceImpl implements LivelinessLocalDataSource {
  @override
  Future<bool> checkLiveliness(LivelinessParams params) async {
    try {
      return true; 
    } catch (e) {
      throw LivelinessException(message: e.toString());
    }
  }

  @override
  Future<bool> getUserFacialInfo(LivelinessParams params) async {
    try {
      return true; 
    } catch (e) {
      throw LivelinessException(message: e.toString());
    }
  }
}