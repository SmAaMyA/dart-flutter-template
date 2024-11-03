import 'package:flutter/material.dart';
import 'package:flutter_application_template/src/pages/home_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'settings/settings_controller.dart';

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
          theme: ThemeData(
            primaryColor: Colors.blue,
            primarySwatch: Colors.blue,
          ),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,
          locale: settingsController.locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: MyHomePage(settingsController: settingsController),
        );
      },
    );
  }
}
