import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  final List<String> bannerItems = [
    'assets/banner.jpg',
    'assets/banner.jpg',
  ];

  final PageController _pageController =
      PageController(initialPage: 1, viewportFraction: 1);

  BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 200, // Adjust the height according to your requirements
        child: PageView.builder(
          controller: _pageController,
          itemCount: bannerItems.length,
          onPageChanged: (value) {
            if (bannerItems.length - 1 == value) {
              _pageController.jumpToPage(1);
            } else if (value == 0) {
              _pageController.jumpToPage(bannerItems.length - 2);
            }
          },
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 2, right: 2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: AspectRatio(
                  aspectRatio: 1.5,
                  child: Image.asset(
                    bannerItems[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
