import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocaleController extends GetxController {
  var locale = const Locale('en').obs;

  void setLocale(Locale newLocale) {
    if (AppLocalizations.supportedLocales.contains(newLocale)) {
      locale.value = newLocale;
      Get.updateLocale(newLocale);
    }
  }
}
