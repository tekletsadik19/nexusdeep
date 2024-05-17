import 'dart:ui';

import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class LivelinessParams {

  LivelinessParams({required this.faces, required this.imageMetadata});
  final List<FaceData> faces;
  final ImageMetadata imageMetadata;
}

class FaceData {

  FaceData({required this.boundingBox, this.leftEyeOpenProbability, this.rightEyeOpenProbability});
  final Rect boundingBox;
  final double? leftEyeOpenProbability;
  final double? rightEyeOpenProbability;
}

class ImageMetadata {

  ImageMetadata({required this.size, required this.rotation});
  final Size size;
  final InputImageRotation rotation;
}
