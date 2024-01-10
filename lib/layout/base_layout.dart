import 'package:flutter/material.dart';

class BaseLayout extends StatelessWidget {

  final Widget content;

  final Widget? navigationBar;

  const BaseLayout({super.key, required this.content, this.navigationBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Сборник энергетиков'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: content,
      bottomNavigationBar: navigationBar,
    );
  }
}