import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paynless/widgets/Radio_tile.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Payment',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Image.asset(
            "assets/Wallet.png",
            fit: BoxFit.fill,
            width: Get.size.width,
            height: Get.size.height,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Choose a payment method",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 10),
                    child: Text("UPI",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[500]!,
                            blurRadius: 1,
                            offset: const Offset(0, 1),
                            spreadRadius: 1,
                          )
                        ],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 150,
                      child: Column(
                        children: [RadioTile()],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text("Credit and Debit Cards",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[600]!,
                            blurRadius: 1,
                            offset: const Offset(0, 1),
                            spreadRadius: 1,
                          )
                        ],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 150,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text("More Payment Options",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[700]!,
                            blurRadius: 2,
                            offset: const Offset(0, 2),
                            spreadRadius: 2,
                          )
                        ],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 150,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
