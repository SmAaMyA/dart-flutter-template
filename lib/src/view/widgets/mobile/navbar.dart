import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MobileNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const MobileNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    final List<BottomNavigationBarItem> bottomNavItems = [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: AppLocalizations.of(context)!.homePageName,
        tooltip: AppLocalizations.of(context)!.homeMenuTooltip,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.swap_horiz),
        label: AppLocalizations.of(context)!.tradePageName,
        tooltip: AppLocalizations.of(context)!.tradePageMenuTooltip,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.more),
        label: AppLocalizations.of(context)!.morePageName,
        tooltip: AppLocalizations.of(context)!.morePageMenuTooltip,
      ),
    ];

    return BottomNavigationBar(
      items: bottomNavItems,
      currentIndex: selectedIndex,
      selectedItemColor: Theme.of(context).colorScheme.primary,
      onTap: onItemTapped,
    );
  }
}