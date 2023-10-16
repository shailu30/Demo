import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Google Books",
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Google Books'),
        ),
        body: Center(
          child: Container(
            color: Colors.white,
            child: const Center(
              child: Text(
                'Hello World!',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
