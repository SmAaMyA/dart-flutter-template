import 'package:flutter/material.dart';
import 'package:flutter_application_template/src/pages/login_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Sidebar extends StatelessWidget {
  final ValueChanged<int> onItemTapped;
  final int currentIndex;

  const Sidebar({
    super.key,
    required this.onItemTapped,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final selectedTileColor = isDarkMode
        ? Colors.white.withOpacity(0.1)
        : primaryColor.withOpacity(0.1);
    final selectedColor = isDarkMode ? Colors.white : primaryColor;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: primaryColor,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(AppLocalizations.of(context)!.home),
            selected: currentIndex == 0,
            selectedTileColor: selectedTileColor,
            selectedColor: selectedColor,
            onTap: () {
              Navigator.pop(context);
              onItemTapped(0);
            },
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text(AppLocalizations.of(context)!.login),
            selected: currentIndex == 5,
            selectedTileColor: selectedTileColor,
            selectedColor: selectedColor,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.swap_horiz),
            title: Text(AppLocalizations.of(context)!.trade),
            selected: currentIndex == 1,
            selectedTileColor: selectedTileColor,
            selectedColor: selectedColor,
            onTap: () {
              Navigator.pop(context);
              onItemTapped(1);
            },
          ),
          ListTile(
            leading: Icon(Icons.pie_chart),
            title: Text(AppLocalizations.of(context)!.portfolio),
            selected: currentIndex == 2,
            selectedTileColor: selectedTileColor,
            selectedColor: selectedColor,
            onTap: () {
              Navigator.pop(context);
              onItemTapped(2);
            },
          ),
          ListTile(
            leading: Icon(Icons.chat),
            title: Text(AppLocalizations.of(context)!.chat),
            selected: currentIndex == 3,
            selectedTileColor: selectedTileColor,
            selectedColor: selectedColor,
            onTap: () {
              Navigator.pop(context);
              onItemTapped(3);
            },
          ),
        ],
      ),
    );
  }
}
