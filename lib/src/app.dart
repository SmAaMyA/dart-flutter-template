import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_application_template/src/localization/app_localizations.dart';
import 'settings/settings_controller.dart';
import 'package:flutter_application_template/src/pages/home_page.dart';

class MyApp extends StatelessWidget {
  final SettingsController settingsController;

  const MyApp({super.key, required this.settingsController});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: settingsController,
      builder: (context, _) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,
          locale: settingsController.locale,
          supportedLocales: const [
            Locale('en', ''), // English
            Locale('th', ''), // Thai
            Locale('zh', ''), // Chinese
          ],
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: MyHomePage(settingsController: settingsController),
        );
      },
    );
  }
}
