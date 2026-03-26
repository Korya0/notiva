import 'package:flutter/material.dart';
// 🔐 Pattern: E2 - Auth Route Guard
// Redirects users based on their login status.

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notiva/core/router/app_routes.dart';
import 'package:notiva/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:notiva/features/auth/presentation/cubit/auth/auth_state.dart';

class AppRouterConfig {
  static String? redirectLogic(BuildContext context, GoRouterState state) {
    final authState = context.read<AuthCubit>().state;
    final isAuthenticated = authState is AuthAuthenticated;

    final isLoggingIn = state.matchedLocation == AppRoutes.login;
    final isSigningUp = state.matchedLocation == AppRoutes.register;
    final isForgotPassword = state.matchedLocation == AppRoutes.forgotPassword;
    final isSplash = state.matchedLocation == AppRoutes.splash;
    final isOnboarding = state.matchedLocation == AppRoutes.onboarding;

    final isPublicRoute =
        isLoggingIn ||
        isSigningUp ||
        isForgotPassword ||
        isSplash ||
        isOnboarding;

    if (!isAuthenticated) {
      // If not logged in and not heading to a public route, force to login.
      return isPublicRoute ? null : AppRoutes.login;
    }

    if (isLoggingIn || isSigningUp || isForgotPassword) {
      // If logged in and heading to login/signup/forgot, redirect to home.
      return AppRoutes.home;
    }

    // No redirection needed
    return null;
  }
}

/* 
💡 Pro-Tip: To make the router reactive to Cubit state, use a 
GoRouterRefreshStream in the 'refreshListenable' property of GoRouter.
*/
/*
  refreshListenable: GoRouterRefreshStream(authCubit.stream),
*/
