import 'dart:io';

import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:uuid/uuid.dart';


class OCRProcess {
  OCRProcess._();

  final Uuid uuid = const Uuid();


  static Future<String> processOCRImage(File imageFile) async {
    final inputImage  =  InputImage.fromFilePath(imageFile.path);
    final textRecognizer = TextRecognizer();
    final recognizedText = await textRecognizer.processImage(inputImage);
    final extractedText = recognizedText.text;
    return extractedText;
  }

  static T valueOrDefault<T>(T? value, T defaultValue) =>
      (value is String && value.isEmpty) || value == null
          ? defaultValue
          : value;

}
