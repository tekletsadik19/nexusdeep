import 'dart:convert';

import 'package:nexusdeep/core/utils/typedef.dart';
import 'package:nexusdeep/features/auth/domain/entities/user.dart';


String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {

  const LoginModel({
    required this.email,
    required this.password,
  });



  final String email;
  final String password;

  DataMap toJson() => {
    'email': email,
    'password': password,
  };


}
