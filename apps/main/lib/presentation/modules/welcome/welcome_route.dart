import 'package:flutter/material.dart';

import 'splash/splash_screen.dart';

class WelcomeRoute {
  Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        SplashScreen.routeName: (context) => SplashScreen(),
      };
}
