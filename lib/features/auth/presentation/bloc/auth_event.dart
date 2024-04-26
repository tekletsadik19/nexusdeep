part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class SignInEvent extends AuthEvent {
  const SignInEvent({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}

class FacebookSignInEvent extends AuthEvent {
  const FacebookSignInEvent();

  @override
  List<Object?> get props => [];
}

class GoogleSignInEvent extends AuthEvent {
  const GoogleSignInEvent();

  @override
  List<Object?> get props => [];
}


class VerifyEmailEvent extends AuthEvent {
  const VerifyEmailEvent({
    required this.code,
    required this.token,
  });
  final String code;
  final String token;

  @override
  List<Object?> get props => [code, token];
}


class SignUpEvent extends AuthEvent {
  const SignUpEvent({
    required this.name,
    required this.email,
    required this.password,
  });
  final String name;
  final String email;
  final String password;

  @override
  List<Object?> get props =>
      [ email, password, name];
}

class ForgotPasswordEvent extends AuthEvent {
  const ForgotPasswordEvent({
    required this.email,
  });

  final String email;

  @override
  List<Object?> get props => [email];
}

class LogoutEvent extends AuthEvent {
  const LogoutEvent();

  @override
  List<Object?> get props => [];
}

class UpdateUserEvent extends AuthEvent {
  UpdateUserEvent({
    required this.action,
    required this.userData,
  }) : assert(
          userData is String || userData is File,
          'userData must be of type String or '
          'File but provided otherwise ${userData.runtimeType}',
        );
  final UpdateUserAction action;
  final dynamic userData;

  @override
  List<Object?> get props => [action, userData];
}
