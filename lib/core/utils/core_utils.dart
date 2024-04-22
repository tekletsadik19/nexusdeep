import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexusdeep/core/extensions/context_extensions.dart';
import 'package:nexusdeep/core/utils/custom_snackbar.dart';
import 'package:uuid/uuid.dart';

class CoreUtils {
  CoreUtils._();

  final Uuid uuid = const Uuid();

  static String getFileExtension(File file) {
    final fileNameSplit = file.path.split('.');
    final extension = fileNameSplit.last;
    return extension;
  }

  static T valueOrDefault<T>(T? value, T defaultValue) =>
      (value is String && value.isEmpty) || value == null
          ? defaultValue
          : value;
  static void showSnackBar(
    BuildContext context,
    ContentType contentType,
    String title,
    String message,
  ) {
    final customSnackBar = CustomSnackBar(
      title: title,
      message: message,
      contentType: contentType,
    );

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: customSnackBar.build(context),
          behavior: SnackBarBehavior.floating,
          backgroundColor: customSnackBar.contentType.color(context),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),

        ),
      );
  }
}
