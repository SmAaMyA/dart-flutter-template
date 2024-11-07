import 'package:flutter/material.dart';
import 'package:flutter_application_template/src/routes/routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

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
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: AppLocalizations.of(context)!.homeMenuName,
          tooltip: AppLocalizations.of(context)!.homeMenuTooltip,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more),
          label: AppLocalizations.of(context)!.more,
          tooltip: AppLocalizations.of(context)!.moreMenuTooltip,
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Theme.of(context).colorScheme.primary,
      onTap: (index) {
        onItemTapped(index);
        if (index == 1) {
          Get.toNamed(AppRoutes.mobileMore);
        }
      },
    );
  }
}
