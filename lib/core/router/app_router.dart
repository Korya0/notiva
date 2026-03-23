import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notiva/core/router/app_routes.dart';
import 'package:notiva/features/splash/presentation/screens/splash_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.root,
  debugLogDiagnostics: true, // Helpful for development

  routes: [
    GoRoute(
      path: AppRoutes.root,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) =>
          const Scaffold(body: Center(child: Text('Login'))),
    ),
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) =>
          const Scaffold(body: Center(child: Text('Home'))),
      routes: [
        GoRoute(
          path: 'details/:id', // Sub-route
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            return Scaffold(body: Center(child: Text('Details for $id')));
          },
        ),
      ],
    ),
  ],

  // 3. Global Error Screen (404 Page)
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('404 - Page Not Found'),
          ElevatedButton(
            onPressed: () => context.go(AppRoutes.root),
            child: const Text('Go Home'),
          ),
        ],
      ),
    ),
  ),
);
