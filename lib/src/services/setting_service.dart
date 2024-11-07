import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingService {
  Future<Locale> locale() async => AppLocalizations.supportedLocales.first;
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
