import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notiva/core/di/service_locator.dart';

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
    return const MaterialApp();
  }
}
