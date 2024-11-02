import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application_template/src/localization/app_localizations.dart';
import 'package:flutter_application_template/src/settings/settings_controller.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'more_page.dart';

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
    final iconColor = isDarkMode ? Colors.white : Colors.black;
    final textColor = isDarkMode ? Colors.white : Colors.black;

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
              DropdownButton<String>(
                value: _selectedLanguage,
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    _changeLanguage(newValue);
                  }
                },
                items: <String>['TH', 'EN', 'ZH']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/flags/${value.toLowerCase()}.svg',
                          width: 24,
                          height: 24,
                        ),
                        const SizedBox(width: 8),
                        Text(_getLanguageName(value)),
                      ],
                    ),
                  );
                }).toList(),
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
          ? BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: iconColor),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.swap_horiz, color: iconColor),
                  label: 'Trade',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.pie_chart, color: iconColor),
                  label: 'Portfolio',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat, color: iconColor),
                  label: 'Chat',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.more_horiz, color: iconColor),
                  label: 'More',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.amber[800],
              unselectedItemColor: textColor,
              onTap: _onItemTapped,
            )
          : null,
    );
  }

  String _getLanguageName(String languageCode) {
    switch (languageCode) {
      case 'EN':
        return 'English';
      case 'ZH':
        return '中文';
      case 'TH':
      default:
        return 'ไทย';
    }
  }
}
