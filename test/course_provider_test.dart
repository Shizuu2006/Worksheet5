import 'package:course_explorer/providers/course_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('toggleFavorite menambah/menghapus dan memanggil listener', () {
    final provider = CourseProvider();
    var notified = 0;
    provider.addListener(() => notified++);

    provider.toggleFavorite('IF101');
    expect(provider.isFavorite('IF101'), true);

    provider.toggleFavorite('IF101');
    expect(provider.isFavorite('IF101'), false);

    expect(notified, 2);
  });
}
