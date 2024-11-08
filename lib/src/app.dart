import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_template/src/controllers/setting_controller.dart';
import 'package:flutter_application_template/src/routes/app_routes.dart';
import 'package:flutter_application_template/src/themes/themes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingController settingController = Get.find();
    return Obx(() {
      return GetMaterialApp(
        theme: FlexColorScheme.light(colorScheme: lightColorScheme).toTheme,
        darkTheme: FlexColorScheme.dark(colorScheme: darkColorScheme).toTheme,
        themeMode: settingController.themeMode,
        locale: settingController.locale,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        initialRoute: AppRoutes.main,
        getPages: AppRoutes.routes,
      );
    });
  }
}
