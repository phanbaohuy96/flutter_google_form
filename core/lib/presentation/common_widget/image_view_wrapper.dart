import 'package:fl_media/fl_media.dart';
import 'package:flutter/widgets.dart';

import '../../common/constants.dart';

class ImageViewWrapper extends ImageView {
  ImageViewWrapper.avatar(
    String source, {
    super.width,
    super.height,
    super.fit,
    super.color,
    super.alignment = Alignment.center,
    super.package,
    super.loadingRadius,
  }) : super(
          source: source,
          placeHolder: coreImageConstant.icUserAvatar,
        );

  ImageViewWrapper.item(
    String source, {
    super.width,
    super.height,
    super.fit,
    super.color,
    super.alignment = Alignment.center,
    super.package,
    super.loadingRadius,
  }) : super(
          source: source,
          placeHolder: coreImageConstant.icDefaultItem,
        );

  ImageViewWrapper.banner(
    String source, {
    super.width,
    super.height,
    super.fit,
    super.color,
    super.alignment = Alignment.center,
    super.package,
    super.loadingRadius,
  }) : super(
          source: source,
          placeHolder: coreImageConstant.icDefaultItem,
        );
}
