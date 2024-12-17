import 'package:core/common/constants.dart' as core_const;
import 'package:injectable/injectable.dart';

import '../../di/di.dart';
import '../../generated/assets.dart';

ImageConstant get imageConstant =>
    injector.get<core_const.CoreImageConstant>() as ImageConstant;

@Singleton(as: core_const.CoreImageConstant)
class ImageConstant extends core_const.CoreImageConstant {
  @override
  String get icUserAvatar => Assets.svg.icUserAvatar;

  @override
  String get imgScreenFormHeader => Assets.image.screenHeader;

  @override
  String get imgMainPageFormHeader => Assets.image.screenHeader;

  @override
  String get logo => Assets.image.icFlutter;

  @override
  String get icDefaultItem => Assets.image.icFlutter;
}
