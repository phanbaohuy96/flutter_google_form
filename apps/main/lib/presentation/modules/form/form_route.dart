import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di/di.dart';
import 'form.dart';

class UpsertFormRoute {
  Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        UpsertFormScreen.routeName: (context) {
          return BlocProvider<UpsertFormBloc>(
            create: (context) => injector(),
            child: const UpsertFormScreen(),
          );
        },

        /// Listing
        ...FormListingRoute().getAll(settings),
      };
}
