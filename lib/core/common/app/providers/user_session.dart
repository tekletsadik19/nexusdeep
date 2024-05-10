import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as https;
import 'package:nexusdeep/core/errors/exceptions.dart';
import 'package:nexusdeep/core/services/config.dart';
import 'package:shared_preferences/shared_preferences.dart';



class UserSession extends GetxController{

  UserSession(this._prefs);

  final _client = https.Client();
  final SharedPreferences _prefs;

  Future<void> reauthenticate() async {
    try {
      final refreshToken = _prefs.getString('accessToken');
      final url = Uri.https(Config.apiUrl, Config.refreshTokenUrl);
      final response = await _client.get(url);

      if (response.statusCode == 200) {
        final newAccessToken = jsonDecode(response.body)['accessToken'] as String;
        await _prefs.setString('accessToken', newAccessToken);
      } else {
        // Handle error or redirect to login
      }
    } catch (e) {
      // Handle error or redirect to login
    }
  }

  Future<String?> refreshToken() async {
    try {
      final refreshToken = _prefs.getString('refreshToken');

      final requestHeaders = <String, String>{
        'Authorization': 'Bearer $refreshToken',
      };

      final url = Uri.https(Config.apiUrl, Config.refreshTokenUrl);

      final response = await https.get(
        url,
        headers:requestHeaders,
      );

      if (response.statusCode == 200) {
        final newAccessToken = jsonDecode(response.body)['accessToken'] as String;
        await _prefs.setString('accessToken', newAccessToken);
        return newAccessToken;
      }

    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      throw ServerException(
        message: e.toString(),
        statusCode: 400,
      );
    }
    return null;
  }

}
