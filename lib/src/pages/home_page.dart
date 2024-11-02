import 'package:flutter/material.dart';
import 'package:flutter_application_template/src/localization/app_localizations.dart';
import 'package:flutter_application_template/src/settings/settings_controller.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'more_page.dart';
import '../widgets/language_selector.dart';
import '../widgets/custom_bottom_navigation_bar.dart';

class MyHomePage extends StatefulWidget {
  final SettingsController settingsController;

  const MyHomePage({super.key, required this.settingsController});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  String _selectedLanguage = 'TH';
  int _selectedIndex = 0;

  void _changeLanguage(String languageCode) {
    Locale newLocale;
    switch (languageCode) {
      case 'EN':
        newLocale = const Locale('en', '');
        break;
      case 'ZH':
        newLocale = const Locale('zh', '');
        break;
      case 'TH':
      default:
        newLocale = const Locale('th', '');
        break;
    }
    widget.settingsController.updateLocale(newLocale);
    setState(() {
      _selectedLanguage = languageCode;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = <Widget>[
      Center(child: Text(AppLocalizations.of(context).hello)),
      Center(child: Text('Trade Page')),
      Center(child: Text('Portfolio Page')),
      Center(child: Text('Chat Page')),
      MorePage(
        selectedLanguage: _selectedLanguage,
        onLanguageChanged: _changeLanguage,
        settingsController: widget.settingsController,
      ),
    ];

    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/flutter_logo.png', // Replace with your logo asset path
              height: 40,
            ),
            const Spacer(),
            if (kIsWeb)
              LanguageSelector(
                selectedLanguage: _selectedLanguage,
                onLanguageChanged: _changeLanguage,
              ),
            if (kIsWeb)
              IconButton(
                icon: Icon(
                    widget.settingsController.themeMode == ThemeMode.light
                        ? Icons.dark_mode
                        : Icons.light_mode),
                onPressed: () {
                  widget.settingsController.updateThemeMode(
                    widget.settingsController.themeMode == ThemeMode.light
                        ? ThemeMode.dark
                        : ThemeMode.light,
                  );
                },
              ),
            if (kIsWeb)
              TextButton(
                onPressed: () {
                  // Handle login action
                },
                child: Text(AppLocalizations.of(context).login),
              ),
            if (kIsWeb)
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  // Handle hamburger menu action
                },
              ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: !kIsWeb && (Platform.isIOS || Platform.isAndroid)
          ? CustomBottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              isDarkMode: isDarkMode,
            )
          : null,
    );
  }
}
