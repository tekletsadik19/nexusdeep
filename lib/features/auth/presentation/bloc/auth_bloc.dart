import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nexusdeep/core/enum/user/update_user.dart';
import 'package:nexusdeep/features/auth/domain/entities/user.dart';
import 'package:nexusdeep/features/auth/domain/usecase/forgot_password.dart';
import 'package:nexusdeep/features/auth/domain/usecase/logout.dart';
import 'package:nexusdeep/features/auth/domain/usecase/sign_in.dart';
import 'package:nexusdeep/features/auth/domain/usecase/sign_up.dart';
import 'package:nexusdeep/features/auth/domain/usecase/update_user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required SignIn signIn,
    required SignUp signUp,
    required UpdateUser updateUser,
    required ForgotPassword forgotPassword,
    required LogoutUseCase logout,
  })  : _signIn = signIn,
        _signUp = signUp,
        _updateUser = updateUser,
        _forgotPassword = forgotPassword,
        _logout = logout,
        super(const AuthInitial()) {
    on<AuthEvent>((event, emit) {
      emit(const AuthLoading());
    });

    on<SignInEvent>(_signInHandler);
    on<SignUpEvent>(_signUpHandler);
    on<ForgotPasswordEvent>(_forgotPasswordHandler);
    on<UpdateUserEvent>(_updateUserHandler);
    on<LogoutEvent>(_logoutHandler);

  }
  final SignIn _signIn;
  final SignUp _signUp;
  final UpdateUser _updateUser;
  final ForgotPassword _forgotPassword;
  final LogoutUseCase _logout;


  Future<void> _signInHandler(
      SignInEvent event, Emitter<AuthState> emit) async {
    final result = await _signIn(
      SignInParams(email: event.email, password: event.password),
    );

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => emit(SignedInState(user)),
    );
  }

  Future<void> _signUpHandler(
      SignUpEvent event, Emitter<AuthState> emit) async {
    final result = await _signUp(
      SignUpParams(
        name: event.name,
        email: event.email,
        password: event.password,
      ),
    );


    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(const SignedUpState()),
    );
  }

  Future<void> _forgotPasswordHandler(
      ForgotPasswordEvent event, Emitter<AuthState> emit) async {
    final result = await _forgotPassword(
      event.email,
    );

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(const ForgotPasswordSentState()),
    );
  }

  Future<void> _updateUserHandler(
      UpdateUserEvent event, Emitter<AuthState> emit) async {
    final result = await _updateUser(
      UpdateUserParams(
        action: event.action,
        userData: event.userData,
      ),
    );

    result.fold(
          (failure) => emit(AuthError(failure.message)),
          (_) => emit(const UserUpdated()),
    );
  }

  Future<void> _logoutHandler(
      LogoutEvent event, Emitter<AuthState> emit) async {
    final result = await _logout();

    result.fold(
          (failure) => emit(AuthError(failure.message)),
          (_) => emit(const LogoutState()),
    );
  }
}
