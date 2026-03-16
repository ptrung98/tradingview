import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loogix_trading/domain/usecases/login_usecase.dart';
import 'package:loogix_trading/domain/usecases/logout_usecase.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;

  AuthBloc({
    required this.loginUseCase,
    required this.logoutUseCase,
  }) : super(const AuthInitial()) {
    on<AuthLoginSubmitted>((event, emit) async {
      emit(const AuthLoading());
      try {
        await loginUseCase(
          username: event.username,
          password: event.password,
        );
        emit(AuthAuthenticated(event.username));
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });

    on<AuthLogoutRequested>((event, emit) async {
      emit(const AuthLoading());
      try {
        await logoutUseCase();
        emit(const AuthInitial());
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });
  }
}

