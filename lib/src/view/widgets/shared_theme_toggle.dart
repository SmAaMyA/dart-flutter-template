import 'package:flutter/material.dart';
import 'package:flutter_application_template/src/controllers/setting_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class SharedThemeToggle extends StatelessWidget {
  const SharedThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingController settingController = Get.find();

    return ConstrainedBox(
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
    );
  }
}
