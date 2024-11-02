import 'package:flutter/material.dart';
import 'package:flutter_application_template/src/localization/app_localizations.dart';
import 'package:flutter_application_template/src/settings/settings_controller.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'language_selector.dart';

class Header extends StatelessWidget {
  final String selectedLanguage;
  final ValueChanged<String> onLanguageChanged;
  final SettingsController settingsController;

  const Header({
    super.key,
    required this.selectedLanguage,
    required this.onLanguageChanged,
    required this.settingsController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/flutter_logo.png', // Replace with your logo asset path
          height: 40,
        ),
        const Spacer(),
        if (kIsWeb)
          LanguageSelector(
            selectedLanguage: selectedLanguage,
            onLanguageChanged: onLanguageChanged,
          ),
        if (kIsWeb)
          IconButton(
            icon: Icon(settingsController.themeMode == ThemeMode.light
                ? Icons.dark_mode
                : Icons.light_mode),
            onPressed: () {
              settingsController.updateThemeMode(
                settingsController.themeMode == ThemeMode.light
                    ? ThemeMode.dark
                    : ThemeMode.light,
              );
            },
          ),
        if (kIsWeb)
          TextButton(
            onPressed: () {
              // Handle login action
            },
            child: Text(AppLocalizations.of(context).login),
          ),
        if (kIsWeb)
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // Handle hamburger menu action
            },
          ),
      ],
    );
  }
}
