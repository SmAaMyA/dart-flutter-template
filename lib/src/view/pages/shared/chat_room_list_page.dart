import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'chat_page.dart';

class ChatRoomListPage extends StatelessWidget {
  const ChatRoomListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final chatRooms = [
      {'name': 'ห้องรวม'},
      {'name': 'อาจารย์หวาน'},
      {'name': 'เจฟ'},
      {'name': 'ติ๊ด'},
      {'name': 'มะปราง'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.chatRooms),
      ),
      body: ListView.builder(
        itemCount: chatRooms.length,
        itemBuilder: (context, index) {
          final chatRoom = chatRooms[index];
          return ListTile(
            title: Text(chatRoom['name']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ChatPage(chatRoomName: chatRoom['name']!),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
