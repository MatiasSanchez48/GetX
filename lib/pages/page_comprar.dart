import 'package:flutter/material.dart';

class PageComprar extends StatelessWidget {
  const PageComprar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Comprar'),
      ),
      body: const Column(
        children: [
          Center(
            child: Text('Page Comprar'),
          ),
        ],
      ),
    );
  }
}
