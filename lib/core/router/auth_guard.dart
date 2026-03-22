import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notiva/core/router/app_routes.dart';

// 🔐 Pattern: E2 - Auth Route Guard
// Redirects users based on their login status.

class AppRouterConfig {
  // Ideally, this list comes from an AuthCubit or AuthProvider
  static bool isAuthenticated = false;

  static String? redirectLogic(BuildContext context, GoRouterState state) {
    final isLoggingIn = state.matchedLocation == AppRoutes.login;

    if (!isAuthenticated) {
      // If not logged in and not heading to login, force to login.
      return isLoggingIn ? null : AppRoutes.login;
    }

    if (isLoggingIn) {
      // If logged in and heading to login, redirect to home.
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
