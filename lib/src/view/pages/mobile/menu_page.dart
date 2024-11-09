import 'package:flutter/material.dart';
import 'package:flutter_application_template/src/routes/app_routes.dart';
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
        title: Text(AppLocalizations.of(context)!.menu),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          ListTile(
            leading: Icon(Icons.login),
            title: Text(AppLocalizations.of(context)!.login),
            onTap: () {
              Get.toNamed(AppRoutes.login);
            },
          ),
          const Divider(),
          Row(
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1.7,
                  child: Material(
                    elevation: 4.0,
                    borderRadius: BorderRadius.circular(8.0),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.changeInformation);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.change_circle_outlined,
                              size: 40,
                              color: Colors.blue,
                            ),
                            SizedBox(height: 8),
                            Text(
                              AppLocalizations.of(context)!.changeInformation,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1.7,
                  child: Material(
                    elevation: 4.0,
                    borderRadius: BorderRadius.circular(8.0),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.suitabilityTest);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.checklist_rounded,
                              size: 40,
                              color: Colors.green,
                            ),
                            SizedBox(height: 8),
                            Text(
                              AppLocalizations.of(context)!.suitabilityTest,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1.7,
                  child: Material(
                    elevation: 4.0,
                    borderRadius: BorderRadius.circular(8.0),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.history);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.history,
                              size: 40,
                              color: Colors.orange,
                            ),
                            SizedBox(height: 8),
                            Text(
                              AppLocalizations.of(context)!.history,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1.7,
                  child: Material(
                    elevation: 4.0,
                    borderRadius: BorderRadius.circular(8.0),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.setting);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.settings,
                              size: 40,
                              color: Colors.purple,
                            ),
                            SizedBox(height: 8),
                            Text(
                              AppLocalizations.of(context)!.settings,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(AppLocalizations.of(context)!.logout),
            onTap: () {
              Get.toNamed(AppRoutes.logout);
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.call),
            title: Text(AppLocalizations.of(context)!.contactUs),
            onTap: () {
              Get.toNamed(AppRoutes.contactUs);
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.language),
            title: Text(AppLocalizations.of(context)!.languageMenuName),
            trailing: SharedLanguageDropdown(showText: true),
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.brightness_6),
            title: Text(AppLocalizations.of(context)!.toggleThemeMenuName),
            trailing: SharedThemeToggle(),
          ),
        ],
      ),
    );
  }
}
