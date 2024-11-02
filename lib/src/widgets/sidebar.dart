import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  final ValueChanged<int> onItemTapped;

  const Sidebar({
    super.key,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
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
            onTap: () {
              Navigator.pop(context);
              onItemTapped(0);
            },
          ),
          ListTile(
            leading: Icon(Icons.swap_horiz),
            title: Text('Trade'),
            onTap: () {
              Navigator.pop(context);
              onItemTapped(1);
            },
          ),
          ListTile(
            leading: Icon(Icons.pie_chart),
            title: Text('Portfolio'),
            onTap: () {
              Navigator.pop(context);
              onItemTapped(2);
            },
          ),
          ListTile(
            leading: Icon(Icons.chat),
            title: Text('Chat'),
            onTap: () {
              Navigator.pop(context);
              onItemTapped(3);
            },
          ),
          ListTile(
            leading: Icon(Icons.more_horiz),
            title: Text('More'),
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
