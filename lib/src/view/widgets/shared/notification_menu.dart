import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotificationMenu extends StatelessWidget {
  const NotificationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      tooltip: AppLocalizations.of(context)!.notificationTooltip,
      icon: Icon(Icons.notifications),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: ListTile(
            leading: Icon(Icons.message),
            title: Text('Notification 1'),
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: ListTile(
            leading: Icon(Icons.message),
            title: Text('Notification 2'),
          ),
        ),
        // Add more notifications here
      ],
      onSelected: (value) {
        // Handle notification selection
        if (value == 1) {
          // Get.toNamed(AppRoutes.notification1);
        } else if (value == 2) {
          // Get.toNamed(AppRoutes.notification2);
        }
      },
    );
  }
}
