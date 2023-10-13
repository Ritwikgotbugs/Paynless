import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Wallet extends StatelessWidget {
  final double wallet;

  const Wallet({super.key, required this.wallet});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        clipBehavior: Clip.none,
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[300]!,
                blurRadius: 4,
                offset: const Offset(0, 2),
                spreadRadius: 3,
              )
            ],
          ),
          child: Center(
            child: ListTile(
              leading: Image.asset('assets/cash.jpg'),
              title: Text(
                '₹ $wallet',
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: TextButton(
                onPressed: () {
                  Get.toNamed("/addcash");
                },
                child: const Text("Add to Wallet +",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
