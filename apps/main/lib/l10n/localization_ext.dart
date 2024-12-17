import 'package:flutter/widgets.dart';

import 'generated/app_localizations.dart';
import 'generated/app_localizations_vi.dart';

export 'generated/app_localizations.dart';

extension AppLocalizationOnContextExt on BuildContext {
  AppLocalizations get coreL10n =>
      AppLocalizations.of(this) ?? AppLocalizationsVi();
}

extension AppLocalizationOnStateExt on State {
  AppLocalizations get coreL10n => context.coreL10n;
}
