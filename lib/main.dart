import 'package:flutter/material.dart';
import 'identity.dart';

void main() => runApp(const MaterialApp(home: Stage6()));

class Stage6 extends StatelessWidget {
  const Stage6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tahap 6 - Scroll')),
      // LANGKAH 1: coba dulu dengan body: _content() saja (akan overflow).
      // LANGKAH 2: bungkus dengan SingleChildScrollView seperti di bawah.
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: _content(),
      ),
    );
  }

  Widget _content() => Column(
        children: [
          const Text('$studentId - $studentName',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          for (var i = 1; i <= 12; i++) ...[
            TextField(
              decoration: InputDecoration(
                labelText: 'Field $i',
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ],
      );
}