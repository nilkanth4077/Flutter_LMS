import 'dart:convert';  // For JSON encoding and decoding
import 'package:http/http.dart' as http;

class ApiService {
  // Replace with your Spring Boot API base URL
  static const String baseUrl = 'http://localhost:8081/'; // Example: 'http://localhost:8080/api'

  // Fetch the list of courses
  Future<List<Map<String, dynamic>>> fetchCourses() async {
    final response = await http.get(Uri.parse('$baseUrl/public/courses/all'));

    if (response.statusCode == 200) {
      // Parse the JSON response into a list of courses
      final List<dynamic> data = json.decode(response.body);
      return List<Map<String, dynamic>>.from(data);
    } else {
      throw Exception('Failed to load courses');
    }
  }

  // Example of GET request
  Future<Map<String, dynamic>> getData(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));

    if (response.statusCode == 200) {
      // Parse the JSON response
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Example of POST request with data
  Future<Map<String, dynamic>> postData(String endpoint, Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$endpoint'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(data),
    );

    if (response.statusCode == 200) {
      // Parse the JSON response
      return json.decode(response.body);
    } else {
      throw Exception('Failed to post data');
    }
  }

// Other methods (PUT, DELETE, etc.) can be added similarly
}
