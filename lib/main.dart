import 'package:flutter/material.dart';
import 'identity.dart';

void main() => runApp(const MaterialApp(home: Stage4()));

const bool showBrokenRow = true; // ubah false jika ingin menyembunyikan Row yang overflow
const skills = ['Flutter', 'Dart', 'Git', 'Firebase', 'UI Design', 'REST API', 'SQL'];

class Stage4 extends StatelessWidget {
  const Stage4({super.key});

  Widget buildBox(String label, Color color) => Container(
        height: 100,
        color: color,
        alignment: Alignment.center,
        child: Text(label),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tahap 4 - Expanded & Wrap')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$studentId - $studentName',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const Text('Expanded flex 2 : 1'),
            Row(
              children: [
                Expanded(flex: 2, child: buildBox('A (flex 2)', Colors.indigo.shade200)),
                const SizedBox(width: 8),
                Expanded(child: buildBox('B (flex 1)', Colors.teal.shade200)),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Wrap (aman)'),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: skills.map((e) => Chip(label: Text(e))).toList(),
            ),
            const SizedBox(height: 16),
            if (showBrokenRow) ...[
              const Text('Row biasa (overflow)'),
              Row(children: skills.map((e) => Chip(label: Text(e))).toList()),
            ],
          ],
        ),
      ),
    );
  }
}