import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChatPage extends StatefulWidget {
  final String chatRoomName;

  const ChatPage({super.key, required this.chatRoomName});

  @override
  ChatPageState createState() => ChatPageState();
}

class ChatPageState extends State<ChatPage> {
  final List<Map<String, dynamic>> _messages = [
    {'text': 'Hello', 'isMe': false},
    {'text': 'Hi', 'isMe': false},
    {'text': 'How are you', 'isMe': false},
    {'text': 'Yeah', 'isMe': true},
    {'text': 'I am fine', 'isMe': true},
    {'text': 'What about you', 'isMe': true},
  ];

  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add({'text': _controller.text, 'isMe': true});
        _controller.clear();
      });
    }
  }

  void _addPicture() {
    // Implement your add picture functionality here
  }

  void _addFile() {
    // Implement your add file functionality here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.chatRoomName),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Align(
                      alignment: message['isMe']
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        margin: const EdgeInsets.symmetric(vertical: 4.0),
                        decoration: BoxDecoration(
                          color: message['isMe']
                              ? Theme.of(context).colorScheme.primaryContainer
                              : Colors.grey[300],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          message['text'],
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.attach_file),
                    onPressed: _addFile,
                  ),
                  IconButton(
                    icon: Icon(Icons.photo),
                    onPressed: _addPicture,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText:
                            AppLocalizations.of(context)!.chatBoxPlaceholder,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: _sendMessage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
