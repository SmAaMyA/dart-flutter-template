import 'package:flutter/material.dart';
import 'package:flutter_application_template/src/view/pages/shared/chat_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChatRoomListPage extends StatelessWidget {
  const ChatRoomListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final chatRooms = [
      {
        'name': 'ห้องรวม',
        'unread': 5,
        'image': 'assets/images/room1.png',
        'latestMessage': 'Hello everyone!'
      },
      {
        'name': 'อาจารย์หวาน',
        'unread': 2,
        'image': 'assets/images/room2.png',
        'latestMessage': 'Please submit your assignments.'
      },
      {
        'name': 'เจฟ',
        'unread': 0,
        'image': 'assets/images/room3.png',
        'latestMessage': 'See you tomorrow.'
      },
      {
        'name': 'ติ๊ด',
        'unread': 3,
        'image': 'assets/images/room4.png',
        'latestMessage': 'Can we meet at 5 PM?'
      },
      {
        'name': 'มะปราง',
        'unread': 1,
        'image': 'assets/images/room5.png',
        'latestMessage': 'I will be late.'
      },
      {
        'name': 'ห้องใหม่',
        'unread': 0,
        'latestMessage': 'Welcome to the new room!'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.chatRooms),
      ),
      body: ListView.builder(
        itemCount: chatRooms.length,
        itemBuilder: (context, index) {
          final chatRoom = chatRooms[index];
          final image = chatRoom['image'];
          final name = chatRoom['name'] as String;
          final unread = chatRoom['unread'] as int;
          final latestMessage = chatRoom['latestMessage'] as String;

          return ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  image != null ? AssetImage(image as String) : null,
              child: image == null
                  ? Text(
                      name[0],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                      ),
                    )
                  : null,
              backgroundColor: image == null ? Colors.blue : null,
            ),
            title: Text(name),
            subtitle: Text(latestMessage),
            trailing: unread > 0
                ? CircleAvatar(
                    radius: 12.0,
                    backgroundColor: Colors.red,
                    child: Text(
                      unread.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    ),
                  )
                : null,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatPage(chatRoomName: name),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
