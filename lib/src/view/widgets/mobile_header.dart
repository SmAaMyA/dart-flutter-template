import 'package:flutter/material.dart';
import 'package:flutter_application_template/src/routes/routes.dart';
import 'package:flutter_application_template/src/view/widgets/shared_notification_menu.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MobileHeader extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

  const MobileHeader({
    super.key,
    this.title,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.home),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/images/logo/asl_logo.svg',
                fit: BoxFit.cover,
                width: 24,
                height: 24,
              ),
            ),
          ),
        ),
        title: title != null ? Text(title!) : null,
        actions: [
          const SizedBox(width: 8),
          NotificationMenu(),
          const SizedBox(width: 8),
        ],
      ),
      body: Center(
        child: Text(AppLocalizations.of(context)!.greeting),
      ),
    );
  }
}
