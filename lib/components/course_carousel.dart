import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CourseCarousel extends StatelessWidget {
  final List<dynamic> courses;

  const CourseCarousel({super.key, required this.courses});

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
      items: courses.map((course) {
        return Builder(
          builder: (BuildContext context) {
            return Image.network(
              course['p_link'],
              fit: BoxFit.fill,
              height: 230.0,
              width: double.infinity,
            );
          },
        );
      }).toList(),
    );
  }
}
