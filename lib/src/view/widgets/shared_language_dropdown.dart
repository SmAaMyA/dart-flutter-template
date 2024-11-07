import 'package:flutter/material.dart';
import 'package:flutter_application_template/src/controllers/setting_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

const Map<String, String> languageNames = {
  'en': 'English',
  'th': 'ภาษาไทย',
  'zh': '中文',
};

class SharedLanguageDropdown extends StatelessWidget {
  final bool showText;

  const SharedLanguageDropdown({super.key, required this.showText});

  @override
  Widget build(BuildContext context) {
    final SettingController settingController = Get.find();

    return Obx(() {
      return ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 35),
        child: Tooltip(
          message: AppLocalizations.of(context)!.languageDropdownToottip,
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
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    if (showText)
                      Text(languageNames[locale.languageCode] ??
                          locale.languageCode),
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
        ),
      );
    });
  }
}
