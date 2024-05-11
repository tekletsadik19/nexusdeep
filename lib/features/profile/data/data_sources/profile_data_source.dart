import 'dart:io';

import 'package:nexusdeep/features/profile/data/models/scan_model.dart';

abstract class ProfileRemoteDataSource {
  const ProfileRemoteDataSource();

  Future<ScanModel> scanPassport({required File firstPage});
  Future<ScanModel> scanDigitalId({required File front, required File back});
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  @override
  Future<ScanModel> scanDigitalId({required File front, required File back}) {
    // TODO: implement scanDigitalId
    throw UnimplementedError();
  }

  @override
  Future<ScanModel> scanPassport({required File firstPage}) {
    // TODO: implement scanPassport
    throw UnimplementedError();
  }

}
