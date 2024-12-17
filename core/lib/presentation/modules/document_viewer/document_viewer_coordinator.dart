import 'package:flutter/material.dart';

import '../../../common/utils.dart';
import 'document_viewer_screen.dart';

export 'document_viewer_screen.dart';

extension DocumentViewerCoordinator on BuildContext {
  Future<T?> viewDocument<T>({
    required String title,
    required MimeType type,
    required String url,
  }) async {
    return Navigator.pushNamed(
      this,
      DocumentViewerScreen.routeName,
      arguments: DocumentViewerArgs(
        title: title,
        type: type,
        url: url,
      ),
    ).then(asOrNull);
  }
}
