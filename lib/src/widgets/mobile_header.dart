import 'package:flutter/material.dart';
import 'package:flutter_application_template/src/settings/settings_controller.dart';

class MobileHeader extends StatelessWidget {
  final String selectedLanguage;
  final ValueChanged<String> onLanguageChanged;
  final SettingsController settingsController;

  const MobileHeader({
    super.key,
    required this.selectedLanguage,
    required this.onLanguageChanged,
    required this.settingsController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          'assets/images/3.0x/flutter_logo.png', // Replace with your logo asset path
          height: 40,
        ),
        Row(
          children: [],
        ),
      ],
    );
  }
}
