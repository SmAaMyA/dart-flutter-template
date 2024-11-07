import 'package:flutter_application_template/src/view/pages/main_page.dart';
import 'package:flutter_application_template/src/view/pages/mobile/more_page.dart';
import 'package:flutter_application_template/src/view/pages/shared/home_page.dart';
import 'package:flutter_application_template/src/view/pages/shared/login_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String main = '/';
  static const String home = '/home';
  static const String login = '/login';
  static const String logout = '/logout';
  static const String mobileMore = '/mobile-more';

  static final routes = [
    GetPage(name: main, page: () => MainPage()),
    GetPage(name: home, page: () => HomePage()),
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: logout, page: () => LoginPage()), // Change to logout page
    GetPage(name: mobileMore, page: () => MobileMorePage()),
  ];
}
