import 'package:flutter_application_template/src/view/main_widget.dart';
import 'package:flutter_application_template/src/view/pages/mobile/menu_page.dart';
import 'package:flutter_application_template/src/view/pages/shared/change_info_page.dart';
import 'package:flutter_application_template/src/view/pages/shared/chat_page.dart';
import 'package:flutter_application_template/src/view/pages/shared/chat_room_list_page.dart';
import 'package:flutter_application_template/src/view/pages/shared/contact_us_page.dart';
import 'package:flutter_application_template/src/view/pages/shared/history_page.dart';
import 'package:flutter_application_template/src/view/pages/shared/home_page.dart';
import 'package:flutter_application_template/src/view/pages/shared/login_page.dart';
import 'package:flutter_application_template/src/view/pages/shared/setting_page.dart';
import 'package:flutter_application_template/src/view/pages/shared/suitability_test_page.dart';
import 'package:flutter_application_template/src/view/pages/shared/trade_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String main = '/';
  static const String home = '/home';
  static const String login = '/login';
  static const String logout = '/logout';
  static const String trade = '/trade';
  static const String chatRooms = '/chat-rooms';
  static const String chat = '/chat';
  static const String mobileMore = '/mobile-more';
  static const String changeInformation = '/change-information';
  static const String suitabilityTest = '/suitability-test';
  static const String history = '/history';
  static const String setting = '/setting';
  static const String contactUs = '/contact-us';

  static final routes = [
    GetPage(name: main, page: () => MainWidget()),
    GetPage(name: home, page: () => HomePage()),
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: logout, page: () => LoginPage()), // Change to logout page
    GetPage(name: trade, page: () => TradePage()),
    GetPage(name: chatRooms, page: () => ChatRoomListPage()),
    GetPage(name: chat, page: () => ChatPage(chatRoomName: 'defaultRoom')),
    GetPage(name: mobileMore, page: () => MobileMorePage()),
    GetPage(name: changeInformation, page: () => ChangeInformationPage()),
    GetPage(name: suitabilityTest, page: () => SuitabilityTestPage()),
    GetPage(name: history, page: () => HistoryPage()),
    GetPage(name: setting, page: () => SettingPage()),
    GetPage(name: contactUs, page: () => ContactUsPage()),
  ];

  static final mobileNavigationBarPages = [
    GetPage(name: home, page: () => HomePage()),
    GetPage(name: trade, page: () => TradePage()),
    GetPage(name: chatRooms, page: () => ChatRoomListPage()),
    GetPage(name: mobileMore, page: () => MobileMorePage()),
  ];

  static final pcWebSidebarPages = [
    GetPage(name: home, page: () => HomePage()),
    GetPage(name: trade, page: () => TradePage()),
    GetPage(name: contactUs, page: () => ContactUsPage()),
  ];
}
