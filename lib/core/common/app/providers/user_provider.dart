import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as https;
import 'package:nexusdeep/core/common/app/providers/user_session.dart';
import 'package:nexusdeep/core/common/network/custom_http_client.dart';
import 'package:nexusdeep/core/errors/exceptions.dart';
import 'package:nexusdeep/core/services/config.dart';
import 'package:nexusdeep/core/utils/typedef.dart';
import 'package:nexusdeep/features/auth/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  UserProvider(this._userSession) {
    _loginStateSubscription = _userSession.isLoggedIn.listen((isLoggedIn) {
      if (!isLoggedIn) {
        _user = null;
      } else {
        _loadUserData();
        _user = user;
      }
      notifyListeners();
    });
  }

  LocalUserModel? _user;
  LocalUserModel? get user => _user;
  final UserSession _userSession;
  StreamSubscription<bool>? _loginStateSubscription;

  void initUser(LocalUserModel? user) {
    if (_user != user) {
      _user = user;
      notifyListeners();
    }
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');
    if (userId != null) {
      final userInfo = await getUserInfo();
      initUser(userInfo);
    }
  }

  set user(LocalUserModel? user) {
    if (_user != user) {
      _user = user;
      Future.delayed(Duration.zero, notifyListeners);
    }
  }

  @override
  void dispose() {
    _loginStateSubscription?.cancel();
    super.dispose();
  }

  @override
  Future<LocalUserModel> getUserInfo() async {
    try {
      final url = Uri.https(Config.apiUrl, Config.getCurrentUserUrl);

      final newAccessToken = await _userSession.refreshToken();
      final requestHeaders = <String, String>{
        'Authorization': 'Bearer $newAccessToken',
      };

      final response = await https.get(
        url,
        headers: requestHeaders,
      );

      if (response.statusCode == 201) {
        final user = LocalUserModel.fromMap(
            json.decode(response.body)['user'] as DataMap);
        return user;
      } else if (response.statusCode == 400) {
        throw ServerException(
          message: (json.decode(response.body)['message']) as String,
          statusCode: response.statusCode.toString(),
        );
      } else {
        throw ServerException(
          message: 'Failed to fetch your data',
          statusCode: response.statusCode.toString(),
        );
      }
    } on SocketException {
      throw const ConnectivityException(message: 'No Internet Connection');
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      throw ServerException(
        message: e.toString(),
        statusCode: 505,
      );
    }
  }
}
