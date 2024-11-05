import 'package:flutter/material.dart';
import 'package:flutter_application_template/src/settings/settings_service.dart';

// A class that many Widgets can interact with to read user settings, update
// user settings, or listen to user settings changes.
//
// Controllers glue Data Services to Flutter Widgets. The SettingsController
// uses the SettingsService to store and retrieve user settings.
class SettingsController with ChangeNotifier {
  // Make SettingsService a private variable so it is not used directly.
  // also persisting the changes with the SettingsService.
  final SettingsService _settingsService;
  SettingsController(this._settingsService);

  late Locale _locale;
  Locale get locale => _locale;

  // Make ThemeMode a private variable so it is not updated directly without
  // Allow Widgets to read the user's preferred ThemeMode.
  late ThemeMode _themeMode;
  ThemeMode get themeMode => _themeMode;

  // Load the user's settings from the SettingsService. It may load from a
  // local database or the internet. The controller only knows it can load the
  // settings from the service.
  Future<void> loadSettings() async {
    _locale = await _settingsService.locale();
    _themeMode = await _settingsService.themeMode();

    // Important! Inform listeners a change has occurred.
    notifyListeners();
  }

  /// Update and persist the Locale based on the user's selection.
  Future<void> updateLocale(Locale newLocale) async {
    if (newLocale == _locale) return;

    // Otherwise, store the new Locale in memory
    _locale = newLocale;

    // Important! Inform listeners a change has occurred.
    notifyListeners();

    // Persist the changes to a local database or the internet using the
    // SettingService.
    await _settingsService.updateLocale(newLocale);
  }

  // Update and persist the ThemeMode based on the user's selection.
  Future<void> updateThemeMode(ThemeMode newThemeMode) async {
    if (newThemeMode == _themeMode) return;

    // Otherwise, store the new ThemeMode in memory
    _themeMode = newThemeMode;

    // Important! Inform listeners a change has occurred.
    notifyListeners();

    // Persist the changes to a local database or the internet using the
    // SettingService.
    await _settingsService.updateThemeMode(newThemeMode);
  }
}
