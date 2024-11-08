import 'package:flutter/material.dart';
import 'package:flutter_application_template/src/routes/routes.dart';
import 'package:flutter_application_template/src/view/widgets/shared/language_dropdown.dart';
import 'package:flutter_application_template/src/view/widgets/shared/notification_menu.dart';
import 'package:flutter_application_template/src/view/widgets/shared/theme_toggle.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PCWebHeader extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

  const PCWebHeader({
    super.key,
    this.title,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final showText = screenWidth * 0.20 >= 115;

    return Scaffold(
      appBar: AppBar(
        leading: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.home),
            child: Tooltip(
              message: AppLocalizations.of(context)!.homeMenuTooltip,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'assets/images/logo/app_logo.svg',
                  fit: BoxFit.cover,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ),
        ),
        title: title != null ? Text(title!) : null,
        actions: [
          const SizedBox(width: 8),
          SharedLanguageDropdown(showText: showText),
          const SizedBox(width: 8),
          SharedThemeToggle(),
          const SizedBox(width: 8),
          NotificationMenu(),
          const SizedBox(width: 8),
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 100),
            child: Tooltip(
              message: AppLocalizations.of(context)!.loginTooltip,
              child: TextButton.icon(
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                label: Text(AppLocalizations.of(context)!.login),
                onPressed: () {
                  Get.toNamed(AppRoutes.login);
                },
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            tooltip: AppLocalizations.of(context)!.menuTooltip,
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
