import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:nexusdeep/core/enum/user/update_user.dart';
import 'package:nexusdeep/core/errors/exceptions.dart';
import 'package:nexusdeep/core/services/config.dart';
import 'package:nexusdeep/core/utils/typedef.dart';
import 'package:nexusdeep/features/auth/data/models/login_model.dart';
import 'package:nexusdeep/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  const AuthRemoteDataSource();
  Future<void> forgotPassword({required String email});
  Future<LocalUserModel> signIn({
    required String email,
    required String password,
  });
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  });
  Future<void> updateUser({
    required UpdateUserAction action,
    required dynamic userData,
  });

  Future<void> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final _client = https.Client();

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


      final response = await _client.post(
        url,
        headers: requestHeaders,
        body:
            json.encode(LoginModel(email: email, password: password).toJson()),
      );

      if (response.statusCode == 200) {
        if(kDebugMode){
          print(json.decode(response.body)['user']);
        }
        final user = LocalUserModel.fromMap(json.decode(response.body)['user'] as DataMap);

        return user;

      } else if (response.statusCode == 400){
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
  Future<void> forgotPassword({required String email}) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<void> signUp(
      {required String name, required String email, required String password}) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  Future<void> updateUser(
      {required UpdateUserAction action, required userData}) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
