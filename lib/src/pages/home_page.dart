import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;
import 'package:flutter/material.dart';
import 'package:flutter_application_template/src/pages/chat_page.dart';
import 'package:flutter_application_template/src/pages/login_page.dart';
import 'package:flutter_application_template/src/pages/more_page.dart';
import 'package:flutter_application_template/src/pages/portfolio_page.dart';
import 'package:flutter_application_template/src/pages/trade_page.dart';
import 'package:flutter_application_template/src/settings/settings_controller.dart';
import 'package:flutter_application_template/src/widgets/mobile_nav_bar.dart';
import 'package:flutter_application_template/src/widgets/mobile_header.dart';
import 'package:flutter_application_template/src/widgets/pc_web_header.dart';
import 'package:flutter_application_template/src/widgets/pc_web_sidebar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyHomePage extends StatefulWidget {
  final SettingsController settingsController;

  const MyHomePage({super.key, required this.settingsController});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  String _selectedLanguage = 'TH';
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isNotMobile = defaultTargetPlatform != TargetPlatform.iOS &&
        defaultTargetPlatform != TargetPlatform.android;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final List<Widget> pages = <Widget>[
      Center(child: Text(AppLocalizations.of(context)!.hello)),
      const TradePage(),
      const PortfolioPage(),
      const ChatPage(),
      if (!isNotMobile)
        MorePage(
          selectedLanguage: _selectedLanguage,
          onLanguageChanged: _changeLanguage,
          settingsController: widget.settingsController,
        ),
      const LoginPage(),
    ];

    return Scaffold(
      appBar: isNotMobile
          ? AppBar(
              title: PCWebHeader(
                selectedLanguage: _selectedLanguage,
                onLanguageChanged: _changeLanguage,
                settingsController: widget.settingsController,
              ),
            )
          : AppBar(
              title: MobileHeader(
                selectedLanguage: _selectedLanguage,
                onLanguageChanged: _changeLanguage,
                settingsController: widget.settingsController,
              ),
            ),
      endDrawer: isNotMobile
          ? Sidebar(
              onItemTapped: _onItemTapped,
              currentIndex: _selectedIndex,
            )
          : null,
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: isNotMobile
          ? null
          : MobileNavigationBar(
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              isDarkMode: isDarkMode,
            ),
    );
  }

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
}
