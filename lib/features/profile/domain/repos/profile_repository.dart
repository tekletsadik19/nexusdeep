

import 'dart:io';

import 'package:nexusdeep/core/utils/typedef.dart';
import 'package:nexusdeep/features/profile/domain/entity/scan_result.dart';

abstract class ProfileRepository{
  const ProfileRepository();


  ResultFuture<ScanResult> scanPassport({
    required File firstPage,
  });

  ResultFuture<ScanResult> scanDigitalId({
    required File front,
    required File back,
  });

}
