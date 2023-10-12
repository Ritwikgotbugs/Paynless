import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paynless/widgets/banners.dart';
import 'package:paynless/widgets/custom_button.dart';
import 'package:paynless/widgets/expandable_fab.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: const Text('Paynless',
            style: TextStyle(color: Colors.black, fontSize: 30)),
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed('/profile');
              },
              icon: Icon(
                Icons.account_circle_rounded,
                color: Colors.black,
                size: 35,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          KButton(
                            text: "Manage Cards",
                            onpressed: () => Get.toNamed('/settings'),
                          ),
                          KButton(
                            text: "View History",
                            onpressed: () => Get.toNamed('/history'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            BannerWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(
                    "Transaction History",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 12),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      children: [
                        Text(
                          "View All",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 19,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ExpandableFab(
        distance: 100,
        children: [
          ActionButton(
            onPressed: () {},
            icon: const Icon(Icons.format_size),
          ),
          ActionButton(
            onPressed: () {},
            icon: const Icon(Icons.insert_photo),
          ),
          ActionButton(
            onPressed: () {},
            icon: const Icon(Icons.videocam),
          ),
        ],
      ),
    );
  }
}
