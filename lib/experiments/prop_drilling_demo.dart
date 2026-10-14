import 'package:flutter/material.dart';

import '../course_data.dart';

class PropDrillingDemoPage extends StatefulWidget {
  const PropDrillingDemoPage({super.key});

  @override
  State<PropDrillingDemoPage> createState() => _PropDrillingDemoPageState();
}

class _PropDrillingDemoPageState extends State<PropDrillingDemoPage> {
  final Set<String> _favoriteCodes = {};

  void _toggleFavorite(String code) {
    setState(() {
      if (!_favoriteCodes.add(code)) {
        _favoriteCodes.remove(code);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demo Prop Drilling')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Favorite dipelihara oleh halaman induk dengan setState().',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Parent meneruskan favorites ke dua child: ringkasan dan '
                  'daftar kursus. Daftar meneruskan nilainya ke setiap baris '
                  'dan mengirim perubahan kembali melalui callback.',
                ),
              ],
            ),
          ),
          _FavoriteSummary(favoriteCodes: _favoriteCodes),
          Expanded(
            child: _CourseList(
              courses: courses,
              favoriteCodes: _favoriteCodes,
              onToggleFavorite: _toggleFavorite,
            ),
          ),
        ],
      ),
    );
  }
}

class _FavoriteSummary extends StatelessWidget {
  final Set<String> favoriteCodes;

  const _FavoriteSummary({required this.favoriteCodes});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        child: ListTile(
          leading: const Icon(Icons.favorite, color: Colors.red),
          title: Text('Jumlah favorite: ${favoriteCodes.length}'),
          subtitle: Text(
            favoriteCodes.isEmpty
                ? 'Belum ada course yang dipilih.'
                : favoriteCodes.join(', '),
          ),
        ),
      ),
    );
  }
}

class _CourseList extends StatelessWidget {
  final List<Map<String, dynamic>> courses;
  final Set<String> favoriteCodes;
  final ValueChanged<String> onToggleFavorite;

  const _CourseList({
    required this.courses,
    required this.favoriteCodes,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: courses.length,
      itemBuilder: (context, index) {
        final course = courses[index];
        final code = course['code'] as String;
        return _CourseRow(
          course: course,
          isFavorite: favoriteCodes.contains(code),
          onFavoriteTap: () => onToggleFavorite(code),
        );
      },
    );
  }
}

class _CourseRow extends StatelessWidget {
  final Map<String, dynamic> course;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;

  const _CourseRow({
    required this.course,
    required this.isFavorite,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(course['title'] as String),
        subtitle: Text(course['code'] as String),
        trailing: IconButton(
          tooltip: isFavorite ? 'Hapus favorite' : 'Tambah favorite',
          onPressed: onFavoriteTap,
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : null,
          ),
        ),
      ),
    );
  }
}
