import 'package:flutter_application_template/src/view/main_widget.dart';
import 'package:flutter_application_template/src/view/pages/mobile/more_page.dart';
import 'package:flutter_application_template/src/view/pages/shared/home_page.dart';
import 'package:flutter_application_template/src/view/pages/shared/login_page.dart';
import 'package:flutter_application_template/src/view/pages/shared/trade_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String main = '/';
  static const String home = '/home';
  static const String login = '/login';
  static const String logout = '/logout';
  static const String trade = '/trade';
  static const String mobileMore = '/mobile-more';

  static final routes = [
    GetPage(name: main, page: () => MainWidget()),
    GetPage(name: home, page: () => HomePage()),
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: logout, page: () => LoginPage()), // Change to logout page
    GetPage(name: trade, page: () => TradePage()),
    GetPage(name: mobileMore, page: () => MobileMorePage()),
  ];

  static final mobileNavigationBarPages = [
    GetPage(name: home, page: () => HomePage()),
    GetPage(name: trade, page: () => TradePage()),
    GetPage(name: mobileMore, page: () => MobileMorePage()),
  ];

  static final pcWebSidebarPages = [
    GetPage(name: home, page: () => HomePage()),
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: logout, page: () => LoginPage()), // Change to logout page
    GetPage(name: trade, page: () => TradePage()),
  ];
}
