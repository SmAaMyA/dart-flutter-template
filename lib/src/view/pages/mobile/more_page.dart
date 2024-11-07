import 'package:flutter/material.dart';
import 'package:flutter_application_template/src/routes/routes.dart';
import 'package:flutter_application_template/src/view/widgets/shared/language_dropdown.dart';
import 'package:flutter_application_template/src/view/widgets/shared/theme_toggle.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class MobileMorePage extends StatelessWidget {
  const MobileMorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.greeting),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          ListTile(
            leading: Icon(Icons.home),
            title: Text(AppLocalizations.of(context)!.more),
            onTap: () {
              Get.toNamed(AppRoutes.home);
            },
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text(AppLocalizations.of(context)!.login),
            onTap: () {
              Get.toNamed(AppRoutes.login);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(AppLocalizations.of(context)!.logout),
            onTap: () {
              Get.toNamed(AppRoutes.logout);
            },
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SharedLanguageDropdown(showText: true),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SharedThemeToggle(),
          ),
        ],
      ),
    );
  }
}
