import 'package:flutter/material.dart';
import 'package:flutter_application_template/src/view/widgets/mobile_header.dart';
import 'package:flutter_application_template/src/view/widgets/pc_web_header.dart';
import 'package:flutter_application_template/src/view/widgets/pc_web_sidebar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = TargetPlatform.iOS == Theme.of(context).platform ||
        TargetPlatform.android == Theme.of(context).platform;

    return Scaffold(
      appBar: isMobile ? MobileHeader() : PCWebHeader(),
      endDrawer: isMobile ? null : PCWebSidebar(),
      body: Text(AppLocalizations.of(context)!.greeting),
    );
  }
}
