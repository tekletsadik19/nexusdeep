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
class SignedUpState extends AuthState{
  const SignedUpState();
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

