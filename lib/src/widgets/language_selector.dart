import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LanguageSelector extends StatelessWidget {
  final String selectedLanguage;
  final ValueChanged<String> onLanguageChanged;

  const LanguageSelector({
    super.key,
    required this.selectedLanguage,
    required this.onLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedLanguage,
      onChanged: (String? newValue) {
        if (newValue != null) {
          onLanguageChanged(newValue);
        }
      },
      items: <String>['TH', 'EN', 'ZH']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipOval(
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: SvgPicture.asset(
                    'assets/images/flags/${value.toLowerCase()}.svg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(_getLanguageName(value)),
            ],
          ),
        );
      }).toList(),
    );
  }

  String _getLanguageName(String languageCode) {
    switch (languageCode) {
      case 'EN':
        return 'English';
      case 'ZH':
        return '中文';
      case 'TH':
      default:
        return 'ไทย';
    }
  }
}
