import 'package:flutter/material.dart';

class SettingsService {
  Future<Locale> locale() async {
    // Load the locale from persistent storage
    return const Locale('th', '');
  }

  Future<ThemeMode> themeMode() async {
    // Load the theme mode from persistent storage
    return ThemeMode.system;
  }

  Future<void> updateLocale(Locale locale) async {
    // Save the locale to persistent storage
  }

  Future<void> updateThemeMode(ThemeMode theme) async {
    // Save the theme mode to persistent storage
  }
}
