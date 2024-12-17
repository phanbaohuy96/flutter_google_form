import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../../../../di/di.dart';
import 'bloc/dynamic_form_detail_bloc.dart';
import 'views/dynamic_form_detail_screen.dart';

class DynamicFormDetailRoute {
  Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        DynamicFormDetailScreen.routeName: (context) {
          final args = asOrNull<DynamicFormDetailArgs>(settings.arguments);
          return BlocProvider<DynamicFormDetailBloc>(
            create: (context) => injector.get(param1: args?.initial),
            child: DynamicFormDetailScreen(args: args),
          );
        },
      };
}
