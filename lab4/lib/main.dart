import 'package:flutter/material.dart';
import 'package:lab4/Widgets/CoreWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void onPress() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CoreWidgets(),
    );
  }
}
