import 'package:flutter/material.dart';
import 'package:flutter_application_template/src/view/widgets/pc_web_header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PCWebHeader(),
      body: Text(AppLocalizations.of(context)!.greeting),
    );
  }
}
