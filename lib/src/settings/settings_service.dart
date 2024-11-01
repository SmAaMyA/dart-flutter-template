import 'package:flutter/material.dart';

/// A service that stores and retrieves user settings.
///
/// By default, this class does not persist user settings. If you'd like to
/// persist the user settings locally, use the shared_preferences package. If
/// you'd like to store settings on a web server, use the http package.
class SettingsService {
  /// Loads the User's preferred ThemeMode from local or remote storage.
  Future<ThemeMode> themeMode() async {
    // Load the theme mode from persistent storage
    return ThemeMode.system;
  }

  /// Persists the user's preferred ThemeMode to local or remote storage.
  Future<void> updateThemeMode(ThemeMode theme) async {
    // Save the theme mode to persistent storage
  }

  Future<Locale> locale() async {
    // Load the locale from persistent storage
    return const Locale('th', '');
  }

  Future<void> updateLocale(Locale locale) async {
    // Save the locale to persistent storage
  }
}
