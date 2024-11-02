import 'package:flutter/material.dart';

class TradePage extends StatelessWidget {
  const TradePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trade Page'),
      ),
      body: Center(
        child: Text(
          'Welcome to the Trade Page!',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
