import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_button.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        clipBehavior: Clip.none,
        child: Container(
          height: 90,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[300]!,
                blurRadius: 4,
                offset: Offset(0, 2),
                spreadRadius: 3,
              )
            ],
          ),
          child: Center(
            child: ListTile(
              leading: Image.asset('assets/cash.jpg'),
              title: Text(
                '₹ 6240.99',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Column(
                children: [
                  Text(
                    "Account Balance",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  TextButton(onPressed: () {}, child: Text("Add to wallet"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}