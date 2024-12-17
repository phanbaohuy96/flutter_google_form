import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../di/di.dart';
import '../l10n/generated/app_localizations.dart';
import 'modules/welcome/splash/bloc/splash_bloc.dart';
import 'modules/welcome/splash/splash_screen.dart';
import 'route/route.dart';
import 'theme/screen_theme.dart';
import 'theme/theme_color.dart';

class MainApplization extends StatefulWidget {
  const MainApplization({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MainApplization> {
  final appBloc = injector<AppGlobalBloc>(
    param1: AppGlobalState(
      lightTheme: AppTheme.factory(
        screenTheme: const ScreenTheme(
          screenFormTheme: AppScreenFormTheme(),
        ),
        themeColor: CustomerThemeColor(),
        fontFamily: 'SF-Pro',
      ),
      darkTheme: AppTheme.factory(
        screenTheme: const ScreenTheme(
          screenFormTheme: AppScreenFormDarkTheme(),
        ),
        themeColor: CustomerDarkThemeColor(),
        fontFamily: 'SF-Pro',
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => appBloc),
      ],
      child: BlocBuilder<AppGlobalBloc, AppGlobalState>(
        builder: (context, state) {
          return MaterialApp(
            theme: state.lightTheme?.theme,
            darkTheme: state.darkTheme?.theme,
            themeMode: state.themeMode,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              FlMeidaLocalizations.delegate,
              CoreLocalizations.delegate,
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLocale.supportedLocales,
            locale: state.locale,
            onGenerateRoute: RouteGenerator().generateRoute,
            navigatorObservers: [myNavigatorObserver],
            navigatorKey: navigatorKey,
            home: BlocProvider(
              create: (context) => SplashBloc(),
              child: SplashScreen(),
            ),
            builder: EasyLoading.init(
              builder: (_, child) {
                return TextScaleFixed(
                  child: child ?? const SizedBox(),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
