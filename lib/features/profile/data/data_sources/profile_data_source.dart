import 'dart:io';

import 'package:nexusdeep/core/services/ocr_process.dart';
import 'package:nexusdeep/features/profile/data/models/scan_model.dart';

abstract class ProfileRemoteDataSource {
  const ProfileRemoteDataSource();

  Future<ScanModel> scanPassport({required File firstPage});
  Future<ScanModel> scanDigitalId({required File front, required File back});
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  @override
  Future<ScanModel> scanDigitalId({
    required File front,
    required File back,
  }) async {
    final frontText = await OCRProcess.processOCRImage(front);
    final backText = await OCRProcess.processOCRImage(back);
    return ScanModel(
      front: front,
      back: back,
    );
  }

  @override
  Future<ScanModel> scanPassport({required File firstPage}) async {
    final pageText = await OCRProcess.processOCRImage(firstPage);
    return ScanModel(firstPage: firstPage);
  }
}
