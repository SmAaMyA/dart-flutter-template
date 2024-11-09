import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChangeInformationPage extends StatelessWidget {
  const ChangeInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.changeInformation),
      ),
      body: Center(
        child: Text(AppLocalizations.of(context)!.changeInformationContent),
      ),
    );
  }
}
