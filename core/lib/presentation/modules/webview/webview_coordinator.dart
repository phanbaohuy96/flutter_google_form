import 'dart:io';

import 'package:flutter/material.dart';

import '../../../common/utils.dart';
import 'webview_screen.dart';

export 'webview_screen.dart';

extension WebViewCoordinator on BuildContext {
  Future<File?> openWebView({
    String? url,
    String? html,
    String? title,
    bool hasBorder = true,
  }) async {
    return Navigator.pushNamed(
      this,
      WebViewScreen.routeName,
      arguments: {
        'param': WebViewArgs(
          url: url,
          html: html,
          title: title,
        ),
        'hasBorder': hasBorder,
      },
    ).then(asOrNull);
  }
}
