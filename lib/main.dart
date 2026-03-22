import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notiva/core/di/service_locator.dart';
import 'package:notiva/core/router/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(setupServiceLocator());
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return MaterialApp.router(
      title: 'Notiva',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}
