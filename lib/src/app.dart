import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application_template/src/localization/app_localizations.dart';
import 'settings/settings_controller.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

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
    final List<Widget> _pages = <Widget>[
      Center(child: Text(AppLocalizations.of(context).hello)),
      Center(child: Text('Search Page')),
      Center(child: Text('Notifications Page')),
      Center(child: Text('Messages Page')),
      Center(child: Text('Profile Page')),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/flutter_logo.png', // Replace with your logo asset path
              height: 40,
            ),
            const Spacer(),
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
            IconButton(
              icon: Icon(widget.settingsController.themeMode == ThemeMode.light
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
            TextButton(
              onPressed: () {
                // Handle login action
              },
              child: Text(AppLocalizations.of(context).login),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // Handle hamburger menu action
            },
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: !kIsWeb && (Platform.isIOS || Platform.isAndroid)
          ? BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications),
                  label: 'Notifications',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.message),
                  label: 'Messages',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.amber[800],
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
