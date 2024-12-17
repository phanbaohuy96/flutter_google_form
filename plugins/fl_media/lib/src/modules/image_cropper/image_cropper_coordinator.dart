import 'dart:io';

import 'package:fl_utils/fl_utils.dart';
import 'package:flutter/material.dart';

import 'image_cropper_screen.dart';

extension ImageCropperCoordinator on BuildContext {
  Future<File?> cropImage({
    required File imagefile,
  }) async {
    return Navigator.pushNamed(
      this,
      ImageCropperScreen.routeName,
      arguments: imagefile,
    ).then(asOrNull);
  }
}
