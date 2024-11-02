import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application_template/src/localization/app_localizations.dart';
import 'package:flutter_application_template/src/settings/settings_controller.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

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
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        if (!kIsWeb)
          DropdownButton<String>(
            value: selectedLanguage,
            onChanged: (String? newValue) {
              if (newValue != null) {
                onLanguageChanged(newValue);
              }
            },
            items: <String>['TH', 'EN', 'ZH']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/flags/${value.toLowerCase()}.svg',
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 8),
                    Text(_getLanguageName(value)),
                  ],
                ),
              );
            }).toList(),
          ),
        if (!kIsWeb)
          ListTile(
            title: Text('Appearance Mode'),
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
        if (!kIsWeb)
          ListTile(
            title: Text(AppLocalizations.of(context).login),
            onTap: () {
              // Handle login action
            },
          ),
      ],
    );
  }

  String _getLanguageName(String languageCode) {
    switch (languageCode) {
      case 'EN':
        return 'English';
      case 'ZH':
        return '中文';
      case 'TH':
      default:
        return 'ไทย';
    }
  }
}
