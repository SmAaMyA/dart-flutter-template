import 'package:flutter/material.dart';
import 'package:flutter_application_template/src/routes/app_routes.dart';
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
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = TargetPlatform.iOS == Theme.of(context).platform ||
        TargetPlatform.android == Theme.of(context).platform;

    return Scaffold(
      appBar: isMobile
          ? MobileHeader()
          : PCWebHeader(pageController: _pageController),
      endDrawer:
          isMobile ? null : PCWebSidebar(pageController: _pageController),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: isMobile
            ? AppRoutes.mobileNavigationBarPages
                .map((page) => page.page())
                .toList()
            : AppRoutes.pcWebSidebarPages.map((page) => page.page()).toList(),
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
