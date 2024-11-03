import 'package:flutter/material.dart';
import 'package:flutter_application_template/src/settings/settings_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'more_page.dart';
import 'trade_page.dart';
import 'portfolio_page.dart';
import 'chat_page.dart';
import '../widgets/custom_bottom_navigation_bar.dart';
import '../widgets/header.dart';
import '../widgets/sidebar.dart';

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
      Center(child: Text(AppLocalizations.of(context)!.hello)),
      const TradePage(),
      const PortfolioPage(),
      const ChatPage(),
      MorePage(
        selectedLanguage: _selectedLanguage,
        onLanguageChanged: _changeLanguage,
        settingsController: widget.settingsController,
      ),
    ];

    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Header(
          selectedLanguage: _selectedLanguage,
          onLanguageChanged: _changeLanguage,
          settingsController: widget.settingsController,
        ),
      ),
      endDrawer: kIsWeb
          ? Sidebar(
              onItemTapped: _onItemTapped,
              currentIndex: _selectedIndex,
            )
          : null,
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
