import 'package:flutter/material.dart';
import 'package:flutter_application_template/src/controllers/setting_controller.dart';
import 'package:flutter_application_template/src/services/setting_service.dart';
import 'package:flutter_application_template/src/view/pages/home_page.dart';
import 'package:flutter_application_template/src/view/pages/login_page.dart';
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
        getPages: [
          GetPage(name: HomePage.routeName, page: () => HomePage()),
          GetPage(name: LoginPage.routeName, page: () => LoginPage()),
        ],
      );
    });
  }
}
