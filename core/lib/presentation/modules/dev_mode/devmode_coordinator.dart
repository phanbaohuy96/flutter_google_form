import 'package:flutter/material.dart';

import '../../../common/utils.dart';
import 'dashboard/dev_mode_dashboard_screen.dart';
import 'design_system/design_system_screen.dart';
import 'log_viewer/log_viewer_screen.dart';

extension DevModeCoordinator on BuildContext {
  Future<T?> openDevMode<T>() async {
    return Navigator.pushNamed(
      this,
      DevModeDashboardScreen.routeName,
    ).then(asOrNull);
  }

  Future<T?> openLogViewer<T>() async {
    return Navigator.pushNamed(
      this,
      LogViewerScreen.routeName,
    ).then(asOrNull);
  }

  Future<T?> viewDesignSystem<T>() async {
    return Navigator.pushNamed(
      this,
      DesignSystemScreen.routeName,
    ).then(asOrNull);
  }
}
