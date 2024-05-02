import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nexusdeep/core/services/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSession extends GetxController {
  final http.Client _client = http.Client();
  final SharedPreferences _prefs = Get.find<SharedPreferences>();

  Future<void> reauthenticate() async {
    try {
      final refreshToken = _prefs.getString('token');
      print(refreshToken);
      final url = Uri.https(Config.apiUrl, Config.refreshTokenUrl);

      final response = await _client.get(url);

      if (response.statusCode == 200) {
        final newAccessToken =
            jsonDecode(response.body)['accessToken'] as String;
        await _prefs.setString('token', newAccessToken);

      } else {
        // Handle error or redirect to login
      }
    } catch (e) {
      // Handle error or redirect to login
    }
  }
}
