import 'package:flutter/widgets.dart';

import 'generated/fl_media_localizations.dart';
import 'generated/fl_media_localizations_vi.dart';

export 'generated/fl_media_localizations.dart';

extension CoreLocalizationOnContextExt on BuildContext {
  FlMeidaLocalizations get flMediaL10n =>
      FlMeidaLocalizations.of(this) ?? FlMeidaLocalizationsVi();
}

extension FlMeidaLocalizationsLocalizationOnStateExt on State {
  FlMeidaLocalizations get flMediaL10n => context.flMediaL10n;
}
