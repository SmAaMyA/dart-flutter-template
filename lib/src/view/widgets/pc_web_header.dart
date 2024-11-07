import 'package:flutter/material.dart';
import 'package:flutter_application_template/src/controllers/setting_controller.dart';
import 'package:flutter_application_template/src/routes/routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

const Map<String, String> languageNames = {
  'en': 'English',
  'th': 'ภาษาไทย',
  'zh': '中文',
};

class PCWebHeader extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

  const PCWebHeader({
    super.key,
    this.title,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final SettingController settingController = Get.find();
    final double screenWidth = MediaQuery.of(context).size.width;
    final showText = screenWidth * 0.20 >= 115;

    return AppBar(
      leading: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => Get.toNamed(AppRoutes.home),
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
      title: title != null ? Text(title!) : null,
      actions: [
        const SizedBox(width: 8),
        Obx(() {
          return ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 35),
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
          );
        }),
        const SizedBox(width: 8),
        ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 35),
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
              Get.toNamed(AppRoutes.login);
            },
          ),
        ),
        SizedBox(width: 8),
      ],
    );
  }
}
