import 'package:aklk_3ndna/core/utils/app_assets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

List<String> items = [
  Assets.imagesDataProjectMeal9P,
  Assets.imagesDataProjectMeal10Kkers,
  Assets.imagesDataProjectMeal8GrillsKilo,
];

CarouselSlider carouselSlider() {
  return CarouselSlider(
    options: CarouselOptions(
      height: 340,
      aspectRatio: 12 / 6,
      viewportFraction: 0.8,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: const Duration(seconds: 3),
      autoPlayAnimationDuration: const Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      enlargeFactor: 0.3,
      onPageChanged: (index, reason) {},
      scrollDirection: Axis.horizontal,
    ),
    items: items.map((i) {
      return Builder(
        builder: (BuildContext context) {
          return Column(
            children: [
              Image.asset(i),
              const SizedBox(
                height: 20,
              ),
              AnimatedSmoothIndicator(
                activeIndex: items.indexOf(i),
                count: items.length,
                effect: const ExpandingDotsEffect(
                  activeDotColor: Colors.orange,
                  dotWidth: 10,
                  dotHeight: 3,
                ),
              ),
            ],
          );
        },
      );
    }).toList(),
  );
}
