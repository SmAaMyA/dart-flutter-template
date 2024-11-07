import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingService {
  static const String _localeKey = 'app_locale';
  static const String _themeModeKey = 'app_theme_mode';

  // Retrieve the stored locale or default to the first supported locale
  Future<Locale> locale() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? localeCode = prefs.getString(_localeKey);
    if (localeCode != null) {
      return Locale(localeCode);
    }
    return AppLocalizations.supportedLocales.first;
  }

  // Retrieve the stored theme mode or default to the system theme mode
  Future<ThemeMode> themeMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? themeMode = prefs.getString(_themeModeKey);
    if (themeMode != null) {
      return ThemeMode.values.firstWhere(
        (e) => e.toString() == themeMode,
        orElse: () => ThemeMode.system,
      );
    }
    return ThemeMode.system;
  }

  // Persist the selected locale
  Future<void> updateLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, locale.languageCode);
  }

  // Persist the selected theme mode
  Future<void> updateThemeMode(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeModeKey, themeMode.toString());
  }
}
