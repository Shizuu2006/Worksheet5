import 'package:flutter/material.dart';
import 'identity.dart';

void main() => runApp(const MaterialApp(home: Stage3()));

class Stage3 extends StatelessWidget {
  const Stage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tahap 3 - LayoutBuilder')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return const CompactLayout();
          } else if (constraints.maxWidth < 840) {
            return const MediumLayout();
          } else {
            return const ExpandedLayout();
          }
        },
      ),
    );
  }
}

// Perbedaan visual: jumlah panel (1 / 2 / 3) dan warna
class CompactLayout extends StatelessWidget {
  const CompactLayout({super.key});
  @override
  Widget build(BuildContext context) =>
      const _LayoutDemo(category: 'Compact', color: Colors.blue, panels: 1);
}

class MediumLayout extends StatelessWidget {
  const MediumLayout({super.key});
  @override
  Widget build(BuildContext context) =>
      const _LayoutDemo(category: 'Medium', color: Colors.green, panels: 2);
}

class ExpandedLayout extends StatelessWidget {
  const ExpandedLayout({super.key});
  @override
  Widget build(BuildContext context) =>
      const _LayoutDemo(category: 'Expanded', color: Colors.orange, panels: 3);
}

class _LayoutDemo extends StatelessWidget {
  final String category;
  final Color color;
  final int panels;
  const _LayoutDemo(
      {required this.category, required this.color, required this.panels});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$studentId - $studentName',
              style: const TextStyle(fontWeight: FontWeight.bold)),
          Text('Kategori: $category',
              style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 12),
          Expanded(
            child: Row(
              children: [
                for (var i = 1; i <= panels; i++)
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      color: color.withOpacity(0.3),
                      alignment: Alignment.center,
                      child: Text('Panel $i'),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}