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
    return BottomNavigationBar(
      selectedItemColor: Theme.of(context).colorScheme.primary,
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: AppLocalizations.of(context)!.home,
          tooltip: AppLocalizations.of(context)!.homeMenuTooltip,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.swap_horiz),
          label: AppLocalizations.of(context)!.trade,
          tooltip: AppLocalizations.of(context)!.tradeMenuTooltip,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more),
          label: AppLocalizations.of(context)!.menu,
          tooltip: AppLocalizations.of(context)!.menuMenuTooltip,
        ),
      ],
    );
  }
}
