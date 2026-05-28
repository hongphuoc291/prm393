import 'package:flutter/material.dart';

class CoreWidgets extends StatelessWidget {
  const CoreWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(title: Text("Exercise 1 – Core Widgets")),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Welcome to Flutter UI",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),

              Center(child: Icon(Icons.movie, size: 80, color: Colors.blue)),
              Image.asset(
                'assets/images/baohong.jpg',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),

              Card(
                margin: EdgeInsets.all(16),
                child: ListTile(
                  leading: Icon(Icons.star),
                  title: Text("Movie Item"),
                  subtitle: Text("This is a sample ListTile inside a Card."),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
