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
  const EmailVerifiedState(this.code);

  final String code;

  @override
  List<Object> get props => [code];
}

class SignedUpState extends AuthState{
  const SignedUpState(this.email);

  final String email;

  @override
  List<Object> get props => [email];
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

