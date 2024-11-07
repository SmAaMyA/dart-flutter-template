import 'package:flutter/material.dart';
import 'package:flutter_application_template/src/controllers/setting_controller.dart';
import 'package:flutter_application_template/src/view/pages/login_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

const Map<String, String> languageNames = {
  'en': 'English',
  'th': 'ภาษาไทย',
  'zh': '中文',
};

class HomePage extends StatelessWidget {
  static const routeName = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingController settingController = Get.find();
    final screenWidth = MediaQuery.of(context).size.width;
    final showText = screenWidth * 0.20 >= 115;

    return Scaffold(
      appBar: AppBar(
        leading: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              Get.toNamed(HomePage.routeName);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/images/logo/asl_logo.svg',
                fit: BoxFit.cover,
                width: 24,
                height: 24,
              ),
            ),
          ),
        ),
        actions: [
          SizedBox(width: 8),
          Obx(() {
            return ConstrainedBox(
              constraints: BoxConstraints(minWidth: 35),
              child: DropdownButton<Locale>(
                value: settingController.locale,
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
                          child: showText
                              ? Text(languageNames[locale.languageCode] ??
                                  locale.languageCode)
                              : null,
                        ),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (Locale? newLocale) {
                  if (newLocale != null) {
                    settingController.setLocale(newLocale);
                  }
                },
              ),
            );
          }),
          SizedBox(width: 8),
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 35),
            child: IconButton(
              tooltip: AppLocalizations.of(context)!.toggleTheme,
              icon: Icon(settingController.themeMode == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode),
              onPressed: () {
                settingController.toggleTheme();
              },
            ),
          ),
          SizedBox(width: 8),
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 100),
            child: TextButton.icon(
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              label: Text(AppLocalizations.of(context)!.login),
              onPressed: () {
                Get.toNamed(LoginPage.routeName);
              },
            ),
          ),
          SizedBox(width: 8),
        ],
      ),
      body: Center(
        child: Text(AppLocalizations.of(context)!.greeting),
      ),
    );
  }
}
