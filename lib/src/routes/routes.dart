import 'package:flutter_application_template/src/view/pages/home_page.dart';
import 'package:flutter_application_template/src/view/pages/login_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final initialRoute = HomePage.routeName;

  static final routes = [
    GetPage(name: HomePage.routeName, page: () => HomePage()),
    GetPage(name: LoginPage.routeName, page: () => LoginPage()),
  ];
}
