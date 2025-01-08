import 'dart:convert';

List<Course> courseFromJson(String str) => List<Course>.from(json.decode(str).map((x) => Course.fromJson(x)));
String courseToJson(List<Course> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Course {
  final int courseId;
  final String courseName;
  final String description;
  final String instructor;
  final double price;
  final String pLink; // Image link
  final String yLink; // YouTube link

  Course({
    required this.courseId,
    required this.courseName,
    required this.description,
    required this.instructor,
    required this.price,
    required this.pLink,
    required this.yLink,
  });

  // Factory constructor to create a Course instance from a JSON object
  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      courseId: json['course_id'],
      courseName: json['course_name'],
      description: json['description'],
      instructor: json['instructor'],
      price: (json['price'] as num).toDouble(), // Ensures double data type
      pLink: json['p_link'],
      yLink: json['y_link'],
    );
  }

  // Method to convert a Course instance to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'course_id': courseId,
      'course_name': courseName,
      'description': description,
      'instructor': instructor,
      'price': price,
      'p_link': pLink,
      'y_link': yLink,
    };
  }
}
