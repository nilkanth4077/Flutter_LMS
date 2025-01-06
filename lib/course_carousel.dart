import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CourseCarousel extends StatelessWidget {
  final List<String> imageUrls = [
    "https://www.excelptp.com/wp-content/uploads/2023/03/Flutter-Development-Course.jpg",
    "https://i.vimeocdn.com/video/1273442216-b8dd2b07d1b8a3d4b22e59569ca094175f5a4c063015ada61?mw=960&mh=540&q=70",
    "https://www.guvi.in/blog/wp-content/uploads/2023/12/effective_ways_to_learn_ui_ux_design-768x384.webp",
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 180.0,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
      ),
      items: imageUrls.map((imageUrl) {
        return Builder(
          builder: (BuildContext context) {
            return Image.network(
              imageUrl,
              fit: BoxFit.fill, // Adjust the image fit as needed
              height: 230.0,
              width: double.infinity,
            );
          },
        );
      }).toList(),
    );
  }
}