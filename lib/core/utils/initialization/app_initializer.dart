import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notiva/core/utils/logging/app_bloc_observer.dart';
import 'package:notiva/core/utils/logging/app_logger.dart';
import 'package:notiva/firebase_options.dart';

class AppInitializer {
  AppInitializer._();

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    Bloc.observer = AppBlocObserver();

    AppLogger.info('App & Firebase Initialized Successfully');
  }
}
