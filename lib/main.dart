import 'package:flutter/material.dart';
import 'identity.dart';

void main() => runApp(const MaterialApp(home: Stage1()));

class Stage1 extends StatelessWidget {
  const Stage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tahap 1 - Hard-coded')),
      body: Row(
        children: [
          Container(
            width: 500,
            color: Colors.amber.shade200,
            padding: const EdgeInsets.all(16),
            child: Text('$studentId - $studentName'),
          ),
        ],
      ),
    );
  }
}
