import '../../../common/definations.dart';

final detailModuleCoordinator = '''import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '$moduleNameKey.dart';

extension ${classNameKey}Coordinator on BuildContext {
  Future<T?> goTo$classNameKey<T>({
    required $modelNameKey object,
  }) async {
    return Navigator.pushNamed(
      this,
      ${classNameKey}Screen.routeName,
      arguments: ${classNameKey}Args(
        initial: object,
      ),
    ).then(asOrNull);
  }

  Future<T?> goTo${classNameKey}ById<T>({
    required String id,
  }) async {
    return Navigator.pushNamed(
      this,
      ${classNameKey}Screen.routeName,
      arguments: ${classNameKey}Args(
        id: id,
      ),
    ).then(asOrNull);
  }
}
''';
