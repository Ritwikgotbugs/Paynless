import 'package:flutter/material.dart';

class AddCash extends StatelessWidget {
  const AddCash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Add Cash'),
      ),
      body: const Center(
        child: Text('Add Cash'),
      ),
    );
  }
}