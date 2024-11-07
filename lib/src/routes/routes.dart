import 'package:flutter_application_template/src/view/pages/home_page.dart';
import 'package:flutter_application_template/src/view/pages/login_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String home = '/';
  static const String login = '/login';

  static final routes = [
    GetPage(name: home, page: () => HomePage()),
    GetPage(name: login, page: () => LoginPage()),
  ];
}
