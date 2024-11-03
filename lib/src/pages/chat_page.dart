import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Page'),
      ),
      body: Center(
        child: Text(
          'Welcome to the Chat Page!',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}