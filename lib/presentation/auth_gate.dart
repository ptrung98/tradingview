import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loogix_trading/presentation/features/auth/auth_bloc.dart';
import 'package:loogix_trading/presentation/features/auth/auth_state.dart';
import 'package:loogix_trading/presentation/features/auth/login_screen.dart';
import 'package:loogix_trading/presentation/shell/app_shell.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthAuthenticated) {
          return const AppShell();
        }
        if (state is AuthLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        return const LoginScreen();
      },
    );
  }
}

