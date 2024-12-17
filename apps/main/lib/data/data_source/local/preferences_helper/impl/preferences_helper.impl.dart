part of '../preferences_helper.dart';

@Injectable(as: PreferencesHelper)
class PreferencesHelperImpl extends PreferencesHelper {
  // ignore: unused_field
  final SharedPreferences _prefs = injector.get();
}
