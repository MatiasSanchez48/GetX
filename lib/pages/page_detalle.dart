import 'package:flutter/material.dart';

class PageDetalle extends StatelessWidget {
  const PageDetalle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Detalle'),
      ),
      body: const Column(
        children: [
          Center(
            child: Text('Page Detalle'),
          ),
        ],
      ),
    );
  }
}
