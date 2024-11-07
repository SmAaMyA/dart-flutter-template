import 'package:flutter/material.dart';

class SettingsService {
  Future<Locale> locale() async => const Locale('en');
  Future<ThemeMode> themeMode() async => ThemeMode.system;

  Future<void> updateLocale(Locale locale) async {
    // Use the shared_preferences package to persist settings locally or the
    // http package to persist settings over the network.
  }

  Future<void> updateThemeMode(ThemeMode theme) async {
    // Use the shared_preferences package to persist settings locally or the
    // http package to persist settings over the network.
  }
}
