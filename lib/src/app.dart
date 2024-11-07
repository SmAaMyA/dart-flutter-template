import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_template/src/controllers/setting_controller.dart';
import 'package:flutter_application_template/src/routes/routes.dart';
import 'package:flutter_application_template/src/services/setting_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  final SettingService settingsService = Get.put(SettingService());
  final SettingController settingController =
      Get.put(SettingController(settingsService: Get.find()));

  App({super.key});

  @override
  Widget build(BuildContext context) {
    settingController.loadSettings();
    return Obx(() {
      return GetMaterialApp(
        theme: FlexColorScheme.light(scheme: FlexScheme.blueM3).toTheme,
        darkTheme: FlexColorScheme.dark(scheme: FlexScheme.blueM3).toTheme,
        themeMode: settingController.themeMode,
        locale: settingController.locale,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        initialRoute: AppRoutes.initialRoute,
        getPages: AppRoutes.routes,
      );
    });
  }
}
