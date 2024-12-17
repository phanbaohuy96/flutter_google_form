import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'di/di.dart';
import 'presentation/app.dart';

class AppDelegate {
  static Future<dynamic> run(AppConfig config) async {
    Config.instance.fromConfig(config);
    return runZonedGuarded(() async {
      final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

      await Hive.initFlutter();

      await configureDependencies(env: Config.instance.appConfig.envName);

      setLocaleMessages(AppLocale.vi.languageCode, ViMessages());
      setLocaleMessages(AppLocale.en.languageCode, EnMessages());

      setDefaultLocale(AppLocale.defaultLocale.languageCode);

      runApp(const MainApplization());
    }, (Object error, StackTrace stack) {
      logUtils.e('Error from runZonedGuarded', error, stack);
    });
  }
}
