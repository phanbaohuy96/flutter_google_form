import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/form.dart';
import '../form.dart';

extension UpsertFormCoordinator on BuildContext {
  Future<DynamicForm?> goToUpsertForm() async {
    return Navigator.pushNamed(
      this,
      UpsertFormScreen.routeName,
    ).then(asOrNull);
  }
}
