import 'package:flutter/material.dart';
import 'package:mask/homepage.dart';

void main() {
  runApp(const Mask());
}

class Mask extends StatelessWidget {
  const Mask({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      home: const Homepage(),
    );
  }
}
