import 'package:flutter/material.dart';
import 'package:flutter_application_template/src/controllers/locale_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_application_template/src/controllers/settings_controller.dart';
import 'package:flutter_application_template/src/view/pages/login_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const Map<String, String> languageNames = {
  'en': 'English',
  'th': 'ภาษาไทย',
  'zh': '中文',
};

class HomePage extends StatelessWidget {
  static const routeName = '/';
  final SettingsController settingsController;
  final bool showText;

  const HomePage({
    super.key,
    required this.settingsController,
    this.showText = true,
  });

  @override
  Widget build(BuildContext context) {
    final LocaleController localeController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          Obx(() {
            return ConstrainedBox(
              constraints: BoxConstraints(minWidth: 35),
              child: DropdownButton<Locale>(
                value: localeController.locale.value,
                items: AppLocalizations.supportedLocales.map((Locale locale) {
                  return DropdownMenuItem<Locale>(
                    value: locale,
                    child: Row(
                      children: [
                        ClipOval(
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: SvgPicture.asset(
                              'assets/images/flags/${locale.languageCode.toLowerCase()}.svg',
                              fit: BoxFit.cover,
                              width: 24,
                              height: 24,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        SizedBox(
                          child: Text(languageNames[locale.languageCode] ??
                              locale.languageCode),
                        ),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (Locale? newLocale) {
                  if (newLocale != null) {
                    localeController.setLocale(newLocale);
                  }
                },
              ),
            );
          }),
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 35),
            child: IconButton(
              tooltip: AppLocalizations.of(context)!.toggleTheme,
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
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 100),
            child: TextButton.icon(
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              // icon: const Icon(Icons.person),
              label: Text(AppLocalizations.of(context)!.login),
              onPressed: () {
                Navigator.restorablePushNamed(context, LoginPage.routeName);
              },
            ),
          ),
        ],
      ),
      body: Center(
        child: Text(AppLocalizations.of(context)!.greeting),
      ),
    );
  }
}
