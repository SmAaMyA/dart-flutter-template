import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FooterNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final bool isDarkMode;

  const FooterNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final selectedItemColor = isDarkMode ? Colors.white : primaryColor;
    final unselectedItemColor = isDarkMode ? Colors.white54 : Colors.black54;

    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: AppLocalizations.of(context)!.home,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.swap_horiz),
          label: AppLocalizations.of(context)!.trade,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.pie_chart),
          label: AppLocalizations.of(context)!.portfolio,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: AppLocalizations.of(context)!.chat,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more_horiz),
          label: AppLocalizations.of(context)!.more,
        ),
      ],
      currentIndex: currentIndex,
      selectedItemColor: selectedItemColor,
      unselectedItemColor: unselectedItemColor,
      selectedLabelStyle: TextStyle(color: selectedItemColor),
      unselectedLabelStyle: TextStyle(color: unselectedItemColor),
      onTap: onTap,
    );
  }
}
