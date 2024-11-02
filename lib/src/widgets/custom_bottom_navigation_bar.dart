import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final bool isDarkMode;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    final iconColor = isDarkMode ? Colors.white : Colors.black;
    final textColor = isDarkMode ? Colors.white : Colors.black;

    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: iconColor),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.swap_horiz, color: iconColor),
          label: 'Trade',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.pie_chart, color: iconColor),
          label: 'Portfolio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat, color: iconColor),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more_horiz, color: iconColor),
          label: 'More',
        ),
      ],
      currentIndex: currentIndex,
      selectedItemColor: Colors.amber[800],
      unselectedItemColor: textColor,
      selectedLabelStyle: TextStyle(color: iconColor),
      unselectedLabelStyle: TextStyle(color: textColor),
      onTap: onTap,
    );
  }
}
