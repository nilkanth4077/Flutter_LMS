import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://10.0.2.2:8081';

  static Future<List<dynamic>> fetchCourses() async {
    const String url = '$baseUrl/public/courses/all';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch courses: ${response.statusCode}');
    }
  }
}