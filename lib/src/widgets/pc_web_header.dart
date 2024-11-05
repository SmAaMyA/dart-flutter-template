import 'package:flutter/material.dart';
import 'package:flutter_application_template/src/pages/login_page.dart';
import 'package:flutter_application_template/src/settings/settings_controller.dart';
import 'package:flutter_application_template/src/widgets/language_selector.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PCWebHeader extends StatelessWidget {
  final String selectedLanguage;
  final ValueChanged<String> onLanguageChanged;
  final SettingsController settingsController;

  const PCWebHeader({
    super.key,
    required this.selectedLanguage,
    required this.onLanguageChanged,
    required this.settingsController,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
            child: Image.asset(
              'assets/images/3.0x/flutter_logo.png', // Replace with your logo asset path
              height: 40,
            ),
          ),
        ),
        Row(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                final showText = screenWidth * 0.20 >= 115;
                return ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: showText ? 115 : 58,
                  ),
                  child: LanguageSelector(
                    selectedLanguage: selectedLanguage,
                    onLanguageChanged: onLanguageChanged,
                    showText: showText,
                  ),
                );
              },
            ),
            SizedBox(width: screenWidth * 0.01),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: 35),
              child: IconButton(
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
            SizedBox(width: screenWidth * 0.01),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: 100),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  AppLocalizations.of(context)!.login,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
