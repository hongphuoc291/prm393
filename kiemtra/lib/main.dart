import 'package:flutter/material.dart';
import 'package:kiemtra_he181356/Views/Pages/HomePage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Homepage(),
      },
    ),
  );
}