import 'package:flutter/material.dart';
import 'package:flutter_application_template/src/controllers/setting_controller.dart';
import 'package:flutter_application_template/src/services/setting_service.dart';
import 'package:flutter_application_template/src/view/pages/home_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  final SettingsService settingsService = Get.put(SettingsService());
  final SettingController settingController =
      Get.put(SettingController(settingsService: Get.find()));

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
        theme: ThemeData(),
        darkTheme: ThemeData.dark(),
        themeMode: settingController.themeMode,
        locale: settingController.locale,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: HomePage(),
      );
    });
  }
}
