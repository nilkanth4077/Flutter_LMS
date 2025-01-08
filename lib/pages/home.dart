import 'package:flutter/material.dart';
import '../api_service.dart';
import '../components/course_carousel.dart';
import '../components/bottom_nav.dart';
import '../components/appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; // For bottom navigation
  List<dynamic> courses = [];
  bool isLoadedCourses = false;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    // Handle navigation based on index if needed
  }

  @override
  void initState() {
    super.initState();
    fetchCourses();
  }

  void fetchCourses() async {
    print('Fetching Courses...');
    try {
      final List<dynamic> fetchedCourses = await ApiService.fetchCourses();
      setState(() {
        courses = fetchedCourses;
        isLoadedCourses = true;
      });
      print('Courses fetched successfully');
    } catch (e) {
      print('Error fetching courses: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          Expanded(child: CourseCarousel()),
          // Displaying Courses
          Expanded(
            child: isLoadedCourses
                ? ListView.builder(
                    itemCount: courses.length,
                    itemBuilder: (context, index) {
                      final course = courses[index];
                      return Card(
                        elevation: 3,
                        margin: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            // Adjust the radius as needed
                            child: Image.network(
                              course['p_link'],
                              width: 90,
                              height: 50,
                              fit: BoxFit.fill,
                            ),
                          ),
                          title: Text(course['course_name']),
                          subtitle: Text(course['instructor']),
                          trailing: Text('\$${course['price']}'),
                        ),
                      );
                    },
                  )
                : const Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
