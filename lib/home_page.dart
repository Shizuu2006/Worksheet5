import 'package:flutter/material.dart';

import 'course_data.dart';
import 'identity.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showDetail = false;

  @override
  Widget build(BuildContext context) {
    final localStateExamples = [
      'Password visibility toggle',
      'Expanded/collapsed detail course',
      'Selected tab aktif',
      'Filter dropdown lokal',
      'Modal menu buka/tutup',
    ];

    final sharedStateExamples = [
      'Favorites yang dipakai banyak screen',
      'Login session / user profile',
      'Theme preference',
      'Cart / keranjang belanja',
      'Progress belajar',
    ];

    return Column(
      children: [
        const IdentityBanner(),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tahap 1 - Local State vs Shared State',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                Text(
                  'Local state cocok untuk widget yang hanya memerlukan state sementara; shared state dibutuhkan lintas screen atau widget.',
                ),
                const SizedBox(height: 16),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Contoh Local State dengan setState()',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        SwitchListTile(
                          contentPadding: EdgeInsets.zero,
                          title: const Text('Tampilkan detail kursus'),
                          value: _showDetail,
                          onChanged: (value) {
                            setState(() => _showDetail = value);
                          },
                        ),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 250),
                          child: _showDetail
                              ? Container(
                                  key: const ValueKey('detail'),
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.primaryContainer,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Text(
                                    'Local state aktif. Detail course bisa ditampilkan atau disembunyikan tanpa mengubah data global aplikasi.',
                                  ),
                                )
                              : const SizedBox.shrink(key: ValueKey('empty')),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Identifikasi State',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    SizedBox(
                      width: 280,
                      child: _StateGroup(
                        title: 'Local State',
                        items: localStateExamples,
                        color: Colors.green.shade100,
                      ),
                    ),
                    SizedBox(
                      width: 280,
                      child: _StateGroup(
                        title: 'Shared State',
                        items: sharedStateExamples,
                        color: Colors.blue.shade100,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'Jelajahi ${courses.length} course yang tersedia.',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final c in courses)
                      Chip(label: Text(c['code'] as String)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _StateGroup extends StatelessWidget {
  final String title;
  final List<String> items;
  final Color color;

  const _StateGroup({
    required this.title,
    required this.items,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 8),
          ...items.map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.check_circle, size: 16),
                    const SizedBox(width: 8),
                    Expanded(child: Text(item)),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
