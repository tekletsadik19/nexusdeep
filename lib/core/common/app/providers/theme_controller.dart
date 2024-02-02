import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  RxBool isDarkTheme = false.obs;

  void changeTheme() {
    isDarkTheme.value = !isDarkTheme.value;
    Get.changeTheme(
      isDarkTheme.value
          ? ThemeData.dark(
              useMaterial3: true,
            )
          : ThemeData.light(
              useMaterial3: true,
            ),
    );
  }
}
