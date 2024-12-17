import '../../../common/definations.dart';

final listingModuleCoordinator = '''import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '$moduleNameKey.dart';

extension ${classNameKey}Coordinator on BuildContext {
  Future<T?> goTo$classNameKey<T>() async {
    return Navigator.pushNamed(
      this,
      ${classNameKey}Screen.routeName,
    ).then(asOrNull);
  }
}
''';
