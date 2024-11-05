import 'package:flutter/material.dart';
import 'package:flutter_application_template/src/pages/login_page.dart';
import 'package:flutter_application_template/src/settings/settings_controller.dart';
import 'package:flutter_application_template/src/widgets/language_selector.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MorePage extends StatelessWidget {
  final String selectedLanguage;
  final ValueChanged<String> onLanguageChanged;
  final SettingsController settingsController;

  const MorePage({
    super.key,
    required this.selectedLanguage,
    required this.onLanguageChanged,
    required this.settingsController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.more),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            leading: Icon(Icons.login),
            title: Text(AppLocalizations.of(context)!.login),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.brightness_6),
            title: Text(AppLocalizations.of(context)!.lightDarkTheme),
            trailing: IconButton(
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
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text(AppLocalizations.of(context)!.language),
            trailing: LanguageSelector(
              selectedLanguage: selectedLanguage,
              onLanguageChanged: onLanguageChanged,
            ),
          ),
        ],
      ),
    );
  }
}
