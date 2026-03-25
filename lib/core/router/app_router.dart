import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notiva/core/di/service_locator.dart';
import 'package:notiva/core/router/app_routes.dart';
import 'package:notiva/core/router/app_transitions.dart';
import 'package:notiva/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:notiva/features/auth/presentation/views/forgot_password_view.dart';
import 'package:notiva/features/auth/presentation/views/login_view.dart';
import 'package:notiva/features/auth/presentation/views/sign_up_view.dart';
import 'package:notiva/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:notiva/features/splash/presentation/screens/splash_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      pageBuilder: (context, state) => AppTransitions.fade(
        context: context,
        state: state,
        child: const SplashScreen(),
      ),
    ),
    GoRoute(
      path: AppRoutes.onboarding,
      pageBuilder: (context, state) => AppTransitions.fade(
        context: context,
        state: state,
        child: const OnboardingView(),
      ),
    ),
    GoRoute(
      path: AppRoutes.login,
      pageBuilder: (context, state) => AppTransitions.slideFromRight(
        context: context,
        state: state,
        child: BlocProvider<AuthCubit>(
          create: (_) => locator<AuthCubit>(),
          child: const LoginView(),
        ),
      ),
    ),
    GoRoute(
      path: AppRoutes.register,
      pageBuilder: (context, state) => AppTransitions.slideFromRight(
        context: context,
        state: state,
        child: BlocProvider<AuthCubit>(
          create: (_) => locator<AuthCubit>(),
          child: const SignUpView(),
        ),
      ),
    ),
    GoRoute(
      path: AppRoutes.forgotPassword,
      pageBuilder: (context, state) => AppTransitions.slideFromRight(
        context: context,
        state: state,
        child: BlocProvider<AuthCubit>(
          create: (_) => locator<AuthCubit>(),
          child: const ForgotPasswordView(),
        ),
      ),
    ),
    GoRoute(
      path: AppRoutes.home,
      pageBuilder: (context, state) => AppTransitions.slideFromRight(
        context: context,
        state: state,
        child: const Scaffold(body: Center(child: Text('Home'))),
      ),
    ),
  ],

  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('404 - Page Not Found'),
          ElevatedButton(
            onPressed: () => context.go(AppRoutes.home),
            child: const Text('Go Home'),
          ),
        ],
      ),
    ),
  ),
);
