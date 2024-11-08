import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SuitabilityTestPage extends StatelessWidget {
  const SuitabilityTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.suitabilityTestPageName),
      ),
      body: Center(
        child: Text(AppLocalizations.of(context)!.suitabilityTestContent),
      ),
    );
  }
}
