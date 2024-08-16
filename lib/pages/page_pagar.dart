import 'package:flutter/material.dart';

class PagePagar extends StatelessWidget {
  const PagePagar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Pagar'),
      ),
      body: const Column(
        children: [
          Center(
            child: Text('Page Pagar'),
          ),
        ],
      ),
    );
  }
}
