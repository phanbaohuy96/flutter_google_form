import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../modules/form/form_route.dart';
import '../modules/main/main_route.dart';
import '../modules/welcome/welcome_route.dart';

class RouteGenerator {
  Map<String, WidgetBuilder> _getAll(RouteSettings settings) => {
        ...CoreRoute().getAll(settings),
        ...MainRoute().getAll(settings),
        ...WelcomeRoute().getAll(settings),
        ...UpsertFormRoute().getAll(settings),
      };

  Route<dynamic> generateRoute(RouteSettings settings) {
    final _builder = _getAll(settings)[settings.name!];

    if ([].any((e) => e == settings.name)) {
      return buildFaderPageRoute(
        _builder ?? (context) => const UnsupportedPage(),
        settings: settings,
      );
    }

    return buildRoute(
      _builder ?? (context) => const UnsupportedPage(),
      settings: settings,
    );
  }
}

Route buildFaderPageRoute<T>(WidgetBuilder builder, {RouteSettings? settings}) {
  return FaderPageRoute<T>(
    builder: (context) => TextScaleFixed(
      child: builder(context),
    ),
    settings: settings,
  );
}

Route buildRoute<T>(WidgetBuilder builder, {RouteSettings? settings}) {
  return CupertinoPageRoute<T>(
    builder: (context) => TextScaleFixed(
      child: builder(context),
    ),
    settings: settings,
  );
}

class FaderPageRoute<T> extends PageRoute<T> {
  FaderPageRoute({
    required this.builder,
    RouteSettings? settings,
  }) : super(settings: settings);

  @override
  Color get barrierColor => Colors.transparent;

  @override
  String get barrierLabel => '';

  final WidgetBuilder builder;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return FadeTransition(
      opacity: animation,
      child: builder(context),
    );
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);
}
