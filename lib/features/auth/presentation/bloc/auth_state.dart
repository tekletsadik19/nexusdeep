part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState{
  const AuthLoading();
}

class SignedInState extends AuthState{
  const SignedInState(this.user);

  final LocalUser user;

  @override
  List<Object> get props => [user];
}

class EmailVerifiedState extends AuthState{
  const EmailVerifiedState(this.code,this.token);

  final String code;
  final String token;


  @override
  List<Object> get props => [code];
}

class SignedUpState extends AuthState{
  const SignedUpState(this.token);

  final String token;

  @override
  List<Object> get props => [token];
}

class SocialSignedInState extends AuthState{
  const SocialSignedInState(this.user);

  final LocalUser user;

  @override
  List<Object> get props => [user];
}

class ForgotPasswordSentState extends AuthState{
  const ForgotPasswordSentState();
}

class UserUpdated extends AuthState{
  const UserUpdated();
}

class LogoutState extends AuthState {
  const LogoutState();
}

class AuthError extends AuthState{
  const AuthError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

