import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as https;
import 'package:nexusdeep/core/errors/exceptions.dart';
import 'package:nexusdeep/core/services/config.dart';
import 'package:nexusdeep/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSession extends GetxController {
  UserSession(this._prefs) {
    _isLoggedIn.add(_prefs.getBool(kIsLoggedIn) ?? false);
  }

  final SharedPreferences _prefs;
  final BehaviorSubject<bool> _isLoggedIn = BehaviorSubject<bool>();
  Stream<bool> get isLoggedIn => _isLoggedIn.stream;
  bool get isLoggedInValue => _isLoggedIn.value;

  void setLoginState(bool isLoggedIn) {
    try {
      _isLoggedIn.add(isLoggedIn);
      _prefs.setBool(kIsLoggedIn, isLoggedIn);

    } catch (e) {
      print('Failed to set login state: $e');
    }
  }

  Future<String?> refreshToken() async {
    try {
      final refreshToken = _prefs.getString('refreshToken');
      if (refreshToken == null) {
        _isLoggedIn.add(false);
        throw const ServerException(
            message: 'No refresh token available', statusCode: 401,
        );
      }

      final requestHeaders = <String, String>{
        'Authorization': 'Bearer $refreshToken',
      };

      final url = Uri.https(Config.apiUrl, Config.refreshTokenUrl);
      final response = await https.get(url, headers: requestHeaders);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final newAccessToken = data['accessToken'] as String;
        final newRefreshToken = data['refreshToken'] as String? ?? refreshToken;

        await _prefs.setString('accessToken', newAccessToken);
        await _prefs.setString('refreshToken', newRefreshToken);
        return newAccessToken;
      } else if (response.statusCode == 401) {
        _isLoggedIn.add(false);
        await logout();
        throw const ServerException(
            message: 'Refresh token expired', statusCode: 401);
      } else {
        throw ServerException(
          message: 'Failed to refresh token',
          statusCode: response.statusCode,
        );
      }
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 400);
    }
  }

  Future<void> logout() async {
    await _prefs.remove('accessToken');
    await _prefs.remove('refreshToken');
    _isLoggedIn.add(false);
    await _prefs.setBool(kIsLoggedIn, false);
    
  }

  @override
  void dispose() {
    _isLoggedIn.close();
    super.dispose();
  }
}
