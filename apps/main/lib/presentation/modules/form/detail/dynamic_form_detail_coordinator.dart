import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/form.dart';
import 'dynamic_form_detail.dart';

extension DynamicFormDetailCoordinator on BuildContext {
  Future<T?> goToDynamicFormDetail<T>({
    required DynamicForm object,
  }) async {
    return Navigator.pushNamed(
      this,
      DynamicFormDetailScreen.routeName,
      arguments: DynamicFormDetailArgs(
        initial: object,
      ),
    ).then(asOrNull);
  }

  Future<T?> goToDynamicFormDetailById<T>({
    required String id,
  }) async {
    return Navigator.pushNamed(
      this,
      DynamicFormDetailScreen.routeName,
      arguments: DynamicFormDetailArgs(
        id: id,
      ),
    ).then(asOrNull);
  }
}
