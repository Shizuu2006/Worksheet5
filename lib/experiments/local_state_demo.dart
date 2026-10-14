import 'package:flutter/material.dart';

import 'prop_drilling_demo.dart';

class LocalStateDemoPage extends StatefulWidget {
  const LocalStateDemoPage({super.key});

  @override
  State<LocalStateDemoPage> createState() => _LocalStateDemoPageState();
}

class _LocalStateDemoPageState extends State<LocalStateDemoPage> {
  int _tapCount = 0;
  bool _showDetails = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Eksperimen Local State')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'State di halaman ini dikelola oleh widget ini dengan setState().',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Counter lokal'),
                  const SizedBox(height: 8),
                  Text('Tombol ditekan $_tapCount kali'),
                  const SizedBox(height: 8),
                  FilledButton.icon(
                    onPressed: () => setState(() => _tapCount++),
                    icon: const Icon(Icons.add),
                    label: const Text('Tambah'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: Column(
              children: [
                SwitchListTile(
                  title: const Text('Tampilkan detail'),
                  value: _showDetails,
                  onChanged: (value) => setState(() => _showDetails = value),
                ),
                if (_showDetails)
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Nilai switch ini hanya dipakai oleh halaman demo ini.',
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Contoh shared state untuk aplikasi ini adalah daftar favorite '
            'yang perlu dibaca dan diubah dari beberapa halaman. Demo ini '
            'belum menyimpan favorite secara global.',
          ),
          const SizedBox(height: 16),
          OutlinedButton.icon(
            onPressed: () => Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (_) => const PropDrillingDemoPage(),
              ),
            ),
            icon: const Icon(Icons.account_tree),
            label: const Text('Buka demo Prop Drilling'),
          ),
        ],
      ),
    );
  }
}
