import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  final ValueChanged<int> onItemTapped;
  final int currentIndex;

  const Sidebar({
    super.key,
    required this.onItemTapped,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final selectedTileColor = isDarkMode
        ? Colors.white.withOpacity(0.1)
        : primaryColor.withOpacity(0.1);
    final selectedColor = isDarkMode ? Colors.white : primaryColor;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: primaryColor,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            selected: currentIndex == 0,
            selectedTileColor: selectedTileColor,
            selectedColor: selectedColor,
            onTap: () {
              Navigator.pop(context);
              onItemTapped(0);
            },
          ),
          ListTile(
            leading: Icon(Icons.swap_horiz),
            title: Text('Trade'),
            selected: currentIndex == 1,
            selectedTileColor: selectedTileColor,
            selectedColor: selectedColor,
            onTap: () {
              Navigator.pop(context);
              onItemTapped(1);
            },
          ),
          ListTile(
            leading: Icon(Icons.pie_chart),
            title: Text('Portfolio'),
            selected: currentIndex == 2,
            selectedTileColor: selectedTileColor,
            selectedColor: selectedColor,
            onTap: () {
              Navigator.pop(context);
              onItemTapped(2);
            },
          ),
          ListTile(
            leading: Icon(Icons.chat),
            title: Text('Chat'),
            selected: currentIndex == 3,
            selectedTileColor: selectedTileColor,
            selectedColor: selectedColor,
            onTap: () {
              Navigator.pop(context);
              onItemTapped(3);
            },
          ),
          ListTile(
            leading: Icon(Icons.more_horiz),
            title: Text('More'),
            selected: currentIndex == 4,
            selectedTileColor: selectedTileColor,
            selectedColor: selectedColor,
            onTap: () {
              Navigator.pop(context);
              onItemTapped(4);
            },
          ),
        ],
      ),
    );
  }
}
