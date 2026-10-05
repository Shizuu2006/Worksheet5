import 'package:flutter_test/flutter_test.dart';

import 'package:course_explorer/main.dart';

void main() {
  testWidgets('Course Explorer renders course list', (tester) async {
    await tester.pumpWidget(const CourseExplorerApp());

    expect(find.text('Course Explorer'), findsOneWidget);
    expect(find.text('Pemrograman Mobile'), findsOneWidget);
    expect(find.text('IF101'), findsOneWidget);
  });
}
