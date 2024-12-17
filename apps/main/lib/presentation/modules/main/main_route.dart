import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'dashboard/cubit/dashboard_cubit.dart';
import 'dashboard/dashboard_screen.dart';

class MainRoute {
  Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        DashboardScreen.routeName: (context) {
          return BlocProvider(
            create: (context) => DashboardCubit(),
            child: DashboardScreen(),
          );
        },
      };
}
