import 'package:flutter/material.dart';
import 'package:flutter_application_template/src/routes/app_routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class PCWebSidebar extends StatelessWidget {
  const PCWebSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Text(
              AppLocalizations.of(context)!.greeting,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(AppLocalizations.of(context)!.homePageName),
            onTap: () {
              Get.toNamed(AppRoutes.home);
            },
          ),
          ListTile(
            leading: Icon(Icons.swap_horiz),
            title: Text(AppLocalizations.of(context)!.tradePageName),
            onTap: () {
              Get.toNamed(AppRoutes.trade);
            },
          ),
          // Add more items here
        ],
      ),
    );
  }
}
