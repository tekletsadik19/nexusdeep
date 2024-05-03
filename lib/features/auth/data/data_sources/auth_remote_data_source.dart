import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as https;
import 'package:nexusdeep/core/common/network/custom_http_client.dart';
import 'package:nexusdeep/core/enum/user/update_user.dart';
import 'package:nexusdeep/core/errors/exceptions.dart';
import 'package:nexusdeep/core/services/config.dart';
import 'package:nexusdeep/core/utils/typedef.dart';
import 'package:nexusdeep/features/auth/data/models/login_model.dart';
import 'package:nexusdeep/features/auth/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthRemoteDataSource {
  const AuthRemoteDataSource();
  Future<void> forgotPassword({required String email});

  Future<LocalUserModel> signIn({
    required String email,
    required String password,
  });

  Future<LocalUserModel> signInWithGoogle();

  Future<LocalUserModel> signInWithFacebook();

  Future<String> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<void> verifyEmail({required String code, required String token});

  Future<void> updateUser({
    required UpdateUserAction action,
    required dynamic userData,
  });

  Future<void> logout();
}

const kIsLoggedIn = 'is_loggedIn';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({
    required FacebookAuth facebookAuthClient,
    required GoogleSignIn googleSignIn,
    required SharedPreferences prefs,
    required CustomHttpClient httpClient
  })  : _facebookAuthClient = facebookAuthClient,
        _googleSignIn = googleSignIn,
        _prefs = prefs,
        _httpClient = httpClient;

  final _client = https.Client();

  final CustomHttpClient _httpClient;

  AccessToken? _accessToken;
  final SharedPreferences _prefs;

  final FacebookAuth _facebookAuthClient;
  final GoogleSignIn _googleSignIn;

  @override
  Future<LocalUserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final requestHeaders = <String, String>{
        'Content-Type': 'application/json',
      };

      final url = Uri.https(Config.apiUrl, Config.loginUrl);

      final response = await _httpClient.client.post(
        url,
        headers: requestHeaders,
        body:
            json.encode(LoginModel(email: email, password: password).toJson()),
      );

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(json.decode(response.body));
        }
        final user = LocalUserModel.fromMap(
            json.decode(response.body)['user'] as DataMap);
        final token = json.decode(response.body)['accessToken'] as String;

        await _prefs.setString('_id', user.uid);
        await _prefs.setString('accessToken', token);
        await _prefs.setBool('isLoggedIn', true);
        return user;
      } else if (response.statusCode == 400) {
        throw ServerException(
          message: (json.decode(response.body)['message']) as String,
          statusCode: response.statusCode.toString(),
        );
      } else {
        throw ServerException(
          message: 'Failed to sign in',
          statusCode: response.statusCode.toString(),
        );
      }
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

  @override
  Future<LocalUserModel> signInWithFacebook() async {
    try {
      DataMap? _userData;
      final requestHeaders = <String, String>{
        'Content-Type': 'application/json',
      };

      final url = Uri.https(Config.apiUrl, Config.socialAuth);

      final result = await _facebookAuthClient.login(
        permissions: ['email', 'public_profile'],
      );

      if (result.status == LoginStatus.success) {
        _accessToken = result.accessToken;

        final userData = await _facebookAuthClient.getUserData();
        _userData = userData;

        final body = json.encode({
          'name': _userData['name'],
          'email': _userData['email'],
          'avatar': _userData['picture'],
        });

        final response = await _httpClient.client.post(
          url,
          headers: requestHeaders,
          body: body,
        );

        if (response.statusCode == 200) {
          final user = LocalUserModel.fromMap(
              json.decode(response.body)['user'] as DataMap);
          final token = json.decode(response.body)['accessToken'] as String;

          await _prefs.setString('_id', user.uid);
          await _prefs.setString('accessToken', token);
          await _prefs.setBool('isLoggedIn', true);
          return user;
        } else if (response.statusCode == 400) {
          throw ServerException(
            message: 'Failed to sign in',
            statusCode: response.statusCode.toString(),
          );
        } else {
          throw ServerException(
            message: 'Failed to sign in',
            statusCode: response.statusCode.toString(),
          );
        }
      } else {
        throw const ServerException(
          message: 'Failed to sign in',
          statusCode: 400,
        );
      }
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

  @override
  Future<LocalUserModel> signInWithGoogle() async {
    try {
      final requestHeaders = <String, String>{
        'Content-Type': 'application/json',
      };

      final url = Uri.https(Config.apiUrl, Config.socialAuth);

      final result = await _googleSignIn.signIn();

      if (result != null) {
        final body = json.encode({
          'name': result.displayName,
          'email': result.email,
          'avatar': result.photoUrl,
        });

        final response = await _httpClient.client.post(
          url,
          headers: requestHeaders,
          body: body,
        );

        if (response.statusCode == 200) {
          if (kDebugMode) {
            print(json.decode(response.body)['user']);
          }

          final user = LocalUserModel.fromMap(
              json.decode(response.body)['user'] as DataMap);
          final token = json.decode(response.body)['accessToken'] as String;

          await _prefs.setString('_id', user.uid);
          await _prefs.setString('accessToken', token);
          await _prefs.setBool('isLoggedIn', true);
          return user;
        } else if (response.statusCode == 400) {
          throw ServerException(
            message: (json.decode(response.body)['message']) as String,
            statusCode: response.statusCode.toString(),
          );
        } else {
          throw ServerException(
            message: 'Failed to sign in',
            statusCode: response.statusCode.toString(),
          );
        }
      } else {
        throw const ServerException(
          message: 'Failed to sign in',
          statusCode: 400,
        );
      }
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

  @override
  Future<String> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final url = Uri.https(Config.apiUrl, Config.signUpUrl);
      final requestHeaders = <String, String>{
        'Content-Type': 'application/json',
      };

      final body = json.encode({
        'name': name,
        'email': email,
        'password': password,
      });

      final response = await _httpClient.client.post(
        url,
        headers: requestHeaders,
        body: body,
      );

      if (response.statusCode == 201) {
        final token = json.decode(response.body)['activationToken'] as String;

        return token;
      } else if (response.statusCode == 400) {
        throw ServerException(
          message: (json.decode(response.body)['message']) as String,
          statusCode: response.statusCode.toString(),
        );
      } else {
        throw ServerException(
          message: 'Failed to sign up',
          statusCode: response.statusCode.toString(),
        );
      }
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

  @override
  Future<void> verifyEmail(
      {required String code, required String token}) async {
    try {
      final url = Uri.https(Config.apiUrl, Config.activateUserUrl);
      final requestHeaders = <String, String>{
        'Content-Type': 'application/json',
      };

      final body = json.encode({
        'activation_code': code,
        'activation_token': token,
      });

      final response = await _httpClient.client.post(
        url,
        headers: requestHeaders,
        body: body,
      );

      if (response.statusCode == 201) {
        if (kDebugMode) {
          print(json.decode(response.body));
        }
      } else if (response.statusCode == 400) {
        throw ServerException(
          message: (json.decode(response.body)['message']) as String,
          statusCode: response.statusCode.toString(),
        );
      } else {
        throw ServerException(
          message: 'Failed to verify your Email',
          statusCode: response.statusCode.toString(),
        );
      }
    } on SocketException {
      throw const ConnectivityException(message: "No Internet Connection");
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

  @override
  Future<void> updateUser(
      {required UpdateUserAction action, required userData}) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  @override
  Future<void> forgotPassword({required String email}) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<void> logout() async {
    try {

      final url = Uri.https(Config.apiUrl, Config.logoutUrl);

      final token = _prefs.getString('accessToken');

      final requestHeaders = <String, String>{
        'Authorization': 'Bearer $token',
      };

      final response = await _httpClient.client.get(
          url,
          headers:requestHeaders,
      );

      if (response.statusCode == 201) {
        // await _facebookAuthClient.logOut();
        await _googleSignIn.signOut();

        await _prefs.remove('accessToken');
        await _prefs.setBool(kIsLoggedIn, false);
      } else if (response.statusCode == 400) {
        throw ServerException(
          message: (json.decode(response.body)['message']) as String,
          statusCode: response.statusCode.toString(),
        );
      } else {
        throw ServerException(
          message: 'Failed to sign Out',
          statusCode: response.statusCode.toString(),
        );
      }
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
