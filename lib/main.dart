import 'package:flutter/material.dart';
import 'courses_page.dart';

void main() => runApp(const CourseExplorerApp());

class CourseExplorerApp extends StatelessWidget {
  const CourseExplorerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Course Explorer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text('Course Explorer')),
        body: const CoursesPage(),
      ),
    );
  }
}