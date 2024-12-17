import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../di/di.dart';
import 'bloc/form_listing_bloc.dart';
import 'views/form_listing_screen.dart';

class FormListingRoute {
  Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        FormListingScreen.routeName: (context) {
          return BlocProvider<FormListingBloc>(
            create: (context) => injector(),
            child: const FormListingScreen(),
          );
        },
      };
}
