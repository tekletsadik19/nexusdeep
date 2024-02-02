import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexusdeep/core/res/colours.dart';
import 'package:uuid/uuid.dart';



class CoreUtils {
  CoreUtils._();


  final Uuid uuid = const Uuid();

  static String getFileExtension(File file){
    final fileNameSplit = file.path.split('.');
    final extension = fileNameSplit.last;
    return extension;
  }

  static T valueOrDefault<T>(T? value, T defaultValue) =>
      (value is String && value.isEmpty) || value == null ? defaultValue : value;
  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 14,
              ),
            ),
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colours.lightPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.all(10),
        ),
      );
  }
}
