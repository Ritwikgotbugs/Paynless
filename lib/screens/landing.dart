import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image.asset(
            "assets/landing.png",
            fit: BoxFit.cover,
            height: Get.size.height,
            width: Get.size.width,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(
                flex: 8,
              ),
              const Text(
                "Let's\nGet Started!",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: Get.size.height * 0.02),
              Container(
                width: Get.size.width * 0.8,
                height: Get.size.height * 0.06,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromRGBO(255, 255, 255, 1),
                      Color.fromRGBO(255, 255, 255, .65)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [-0.5, 1.2],
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: OutlinedButton(
                  style: ButtonStyle(
                    side: MaterialStateProperty.all<BorderSide>(
                      const BorderSide(
                        color: Color(0xFF153B43),
                      ),
                    ),
                    overlayColor: MaterialStateProperty.all<Color>(
                      const Color.fromRGBO(21, 59, 67, 0.1),
                    ),
                  ),
                  onPressed: () {
                    Get.toNamed('/login');
                  },
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      color: Color(0xFF153B43),
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          )
        ],
      ),
    );
  }
}
