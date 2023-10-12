import 'package:flutter/material.dart';

class Analytics extends StatelessWidget {
  const Analytics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Analytics'),
      ),
      body: const Center(
        child: Text('Analytics'),
      ),
    );
  }
}
