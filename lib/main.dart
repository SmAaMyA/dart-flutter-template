import 'package:flutter/material.dart';
import 'package:flutter_application_template/src/app.dart';
import 'package:flutter_application_template/src/controllers/setting_controller.dart';
import 'package:flutter_application_template/src/services/setting_service.dart';
import 'package:get/get.dart';

void main() async {
  Get.put(SettingService());
  final SettingController settingController =
      Get.put(SettingController(settingsService: Get.find()));
  await settingController.loadSettings();

  runApp(App());
}
