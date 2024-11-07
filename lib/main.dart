import 'package:flutter/material.dart';
import 'package:flutter_application_template/src/app.dart';
import 'package:get/get.dart';

import 'src/controllers/setting_controller.dart';
import 'src/services/setting_service.dart';

void main() async {
  Get.put(SettingService());
  final SettingController settingController =
      Get.put(SettingController(settingsService: Get.find()));
  await settingController.loadSettings();

  runApp(App());
}
