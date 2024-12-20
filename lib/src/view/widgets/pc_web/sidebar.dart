import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PCWebSidebar extends StatelessWidget {
  final PageController pageController;

  const PCWebSidebar({super.key, required this.pageController});

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
            title: Text(AppLocalizations.of(context)!.home),
            onTap: () {
              pageController.jumpToPage(0);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.swap_horiz),
            title: Text(AppLocalizations.of(context)!.trade),
            onTap: () {
              pageController.jumpToPage(1);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text(AppLocalizations.of(context)!.contactUs),
            onTap: () {
              pageController.jumpToPage(2);
              Navigator.pop(context);
            },
          ),
          // Add more ListTile items here
        ],
      ),
    );
  }
}
