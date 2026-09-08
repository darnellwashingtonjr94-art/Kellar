import 'package:flutter/material.dart';

void main() {
  runApp(const KellarMobileApp());
}

class KellarMobileApp extends StatelessWidget {
  const KellarMobileApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kellar Edge',
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: const Text('Kellar Mobile Control Center')),
        body: const Center(child: Text('Engine Status: Operational')),
      ),
    );
  }
}
