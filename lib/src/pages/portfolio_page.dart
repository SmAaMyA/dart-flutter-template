import 'package:flutter/material.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio Page'),
      ),
      body: Center(
        child: Text(
          'Welcome to the Portfolio Page!',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
