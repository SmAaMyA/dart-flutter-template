import 'package:flutter_application_template/src/services/setting_service.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingController extends GetxController {
  final SettingsService _settingsService;
  final Rx<Locale> _locale = const Locale('en').obs;
  final Rx<ThemeMode> _themeMode = ThemeMode.system.obs;

  SettingController({required SettingsService settingsService})
      : _settingsService = settingsService;

  Locale get locale => _locale.value;
  ThemeMode get themeMode => _themeMode.value;

  Future<void> loadSettings() async {
    _locale.value = await _settingsService.locale();
    _themeMode.value = await _settingsService.themeMode();
  }

  Future<void> setLocale(Locale newLocale) async {
    if (AppLocalizations.supportedLocales.contains(newLocale)) {
      _locale.value = newLocale;
      await _settingsService.updateLocale(_locale.value);
      Get.updateLocale(_locale.value);
    }
  }

  Future<void> toggleTheme() async {
    if (_themeMode.value == ThemeMode.light) {
      _themeMode.value = ThemeMode.dark;
    } else {
      _themeMode.value = ThemeMode.light;
    }
    await _settingsService.updateThemeMode(_themeMode.value);
    Get.changeThemeMode(_themeMode.value);
  }
}
