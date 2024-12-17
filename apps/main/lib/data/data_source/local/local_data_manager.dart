import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

import 'preferences_helper/preferences_helper.dart';

@Injectable()
class LocalDataManager extends CoreLocalDataManager
    implements AppPreferenceData {
  // ignore: unused_field
  final PreferencesHelper _appPrefs;

  LocalDataManager(
    this._appPrefs,
    super.preferencesHelper,
  );
}
