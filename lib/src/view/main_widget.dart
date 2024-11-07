import 'package:flutter/material.dart';
import 'package:flutter_application_template/src/view/pages/mobile/more_page.dart';
import 'package:flutter_application_template/src/view/pages/shared/home_page.dart';
import 'package:flutter_application_template/src/view/pages/shared/trade_page.dart';
import 'package:flutter_application_template/src/view/widgets/mobile/header.dart';
import 'package:flutter_application_template/src/view/widgets/pc_web/header.dart';
import 'package:flutter_application_template/src/view/widgets/pc_web/sidebar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({super.key});

  @override
  MainWidgetState createState() => MainWidgetState();
}

class MainWidgetState extends State<MainWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = TargetPlatform.iOS == Theme.of(context).platform ||
        TargetPlatform.android == Theme.of(context).platform;

    final List<Widget> pages = <Widget>[
      HomePage(),
      TradePage(),
      MobileMorePage(),
    ];

    final List<BottomNavigationBarItem> bottomNavItems = [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: AppLocalizations.of(context)!.homeMenuName,
        tooltip: AppLocalizations.of(context)!.homeMenuTooltip,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.swap_horiz),
        label: AppLocalizations.of(context)!.tradeMenuName,
        tooltip: AppLocalizations.of(context)!.tradeMenuTooltip,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.more),
        label: AppLocalizations.of(context)!.moreMenuName,
        tooltip: AppLocalizations.of(context)!.moreMenuTooltip,
      ),
    ];

    return Scaffold(
      appBar: isMobile ? MobileHeader() : PCWebHeader(),
      endDrawer: isMobile ? null : PCWebSidebar(),
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: isMobile
          ? BottomNavigationBar(
              items: bottomNavItems,
              currentIndex: _selectedIndex,
              selectedItemColor: Theme.of(context).colorScheme.primary,
              onTap: _onItemTapped,
            )
          : null,
    );
  }
}
