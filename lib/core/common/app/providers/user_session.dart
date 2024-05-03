import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as https;
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
      final url = Uri.https(Config.apiUrl, Config.refreshTokenUrl);
      final response = await _client.get(url);

      if (response.statusCode == 200) {
        final newAccessToken = jsonDecode(response.body)['accessToken'] as String;
        await _prefs.setString('accessToken', newAccessToken);
        return newAccessToken;
      }
    } catch (e) {
      // Handle error or redirect to login
    }
    return null;
  }

}
