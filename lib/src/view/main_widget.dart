import 'package:flutter/material.dart';
import 'package:flutter_application_template/src/view/pages/mobile/more_page.dart';
import 'package:flutter_application_template/src/view/pages/shared/home_page.dart';
import 'package:flutter_application_template/src/view/pages/shared/trade_page.dart';
import 'package:flutter_application_template/src/view/widgets/mobile/header.dart';
import 'package:flutter_application_template/src/view/widgets/mobile/navbar.dart';
import 'package:flutter_application_template/src/view/widgets/pc_web/header.dart';
import 'package:flutter_application_template/src/view/widgets/pc_web/sidebar.dart';

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

    return Scaffold(
      appBar: isMobile ? MobileHeader() : PCWebHeader(),
      endDrawer: isMobile ? null : PCWebSidebar(),
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: isMobile
          ? MobileNavigationBar(
              selectedIndex: _selectedIndex,
              onItemTapped: _onItemTapped,
            )
          : null,
    );
  }
}
