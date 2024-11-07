import 'package:flutter/material.dart';
import 'package:flutter_application_template/src/controllers/locale_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_application_template/src/controllers/settings_controller.dart';
import 'package:flutter_application_template/src/view/pages/home_page.dart';
import 'package:flutter_application_template/src/view/pages/settings_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  final LocaleController localeController = Get.put(LocaleController());
  final SettingsController settingsController;

  MyApp({
    super.key,
    required this.settingsController,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
        theme: ThemeData(),
        darkTheme: ThemeData.dark(),
        themeMode: settingsController.themeMode,
        locale: localeController.locale.value,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        onGenerateRoute: (RouteSettings routeSettings) {
          return MaterialPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) {
              switch (routeSettings.name) {
                case HomePage.routeName:
                  return HomePage(settingsController: settingsController);
                case SettingsView.routeName:
                  return SettingsView(settingsController: settingsController);
                default:
                  return HomePage(settingsController: settingsController);
              }
            },
          );
        },
      );
    });
  }
}
