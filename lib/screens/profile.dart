import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paynless/utils/db.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () async {
              await db.auth.signOut();
              Get.offAllNamed('/login');
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: const Center(
        child: Text('Profile'),
      ),
    );
  }
}
