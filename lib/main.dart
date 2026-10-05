import 'package:flutter/material.dart';
import 'identity.dart';

void main() => runApp(const MaterialApp(home: Stage2()));

class Stage2 extends StatelessWidget {
  const Stage2({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    final category = size.width < 600 ? 'Compact' : 'Wide';

    return Scaffold(
      appBar: AppBar(title: const Text('Tahap 2 - MediaQuery')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$studentId - $studentName',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Text('Width: ${size.width.toStringAsFixed(0)}'),
            Text('Height: ${size.height.toStringAsFixed(0)}'),
            Text('Orientation: $orientation'),
            const SizedBox(height: 12),
            Text('Kategori: $category',
                style: Theme.of(context).textTheme.headlineSmall),
          ],
        ),
      ),
    );
  }
}