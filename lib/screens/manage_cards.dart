import 'package:flutter/material.dart';

class ManageCards extends StatelessWidget {
  const ManageCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Cards'),
      ),
      body: const Center(
        child: Text('Manage Cards'),
      ),
    );
  }
}
