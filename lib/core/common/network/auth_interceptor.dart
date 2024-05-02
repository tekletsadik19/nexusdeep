import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nexusdeep/core/common/app/providers/user_session.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomHttpClient {
  final http.Client _client = http.Client();
  final UserSession _userSession = Get.find<UserSession>();
  final SharedPreferences _prefs = Get.find<SharedPreferences>();

  Future<http.Response> post(String url,
      {Map<String, String>? headers, body, Encoding? encoding}) async {
    final accessToken = _prefs.getString('token');
    headers = {...?headers, 'Authorization': 'Bearer $accessToken'};
    try {
      final response = await _client.post(Uri.parse(url), headers: headers, body: body, encoding: encoding);
      if (response.statusCode == HttpStatus.unauthorized) {
        await _userSession.reauthenticate();
        return post(url, headers: headers, body: body, encoding: encoding); // Retry the request
      }
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
