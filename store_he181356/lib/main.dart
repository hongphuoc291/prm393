import 'package:flutter/material.dart';
import 'package:store_he181356/Views/Pages/HomePage.dart';
import 'package:store_he181356/Views/Pages/ProductDetailPage.dart';
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

