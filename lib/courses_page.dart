import 'package:flutter/material.dart';

import 'course_card.dart';
import 'course_data.dart';
import 'identity.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  int _columnsFor(double width) {
    if (width < 600) return 1;
    if (width < 840) return 2;
    return 3;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const IdentityBanner(),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: _columnsFor(constraints.maxWidth),
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  mainAxisExtent: 150,
                ),
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  return CourseCard(course: courses[index]);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
