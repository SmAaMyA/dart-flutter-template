import 'package:flutter/material.dart';
import 'package:flutter_application_template/src/controllers/locale_controller.dart';
import 'package:flutter_application_template/src/services/settings_service.dart';
import 'package:flutter_application_template/src/controllers/settings_controller.dart';
import 'package:flutter_application_template/src/app.dart';
import 'package:get/get.dart';

void main() async {
  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();
  runApp(MyApp(settingsController: settingsController));
}
