import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexusdeep/core/res/app_theme.dart';

class ThemeController extends GetxController {
  RxBool isDarkTheme = false.obs;

  void changeTheme(ThemeMode mode) {
    Get.changeThemeMode(mode);
    CoreTheme.saveThemeMode(mode);
  }
}
