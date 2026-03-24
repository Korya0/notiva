import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notiva/core/utils/app_bloc_observer.dart';
import 'package:notiva/core/utils/app_logger.dart';

class AppInitializer {
  AppInitializer._();

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    Bloc.observer = AppBlocObserver();

    AppLogger.info('App Initialized Successfully');
  }
}
