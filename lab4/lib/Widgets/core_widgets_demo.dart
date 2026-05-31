import 'package:flutter/material.dart';

class CoreWidgets extends StatelessWidget {
  const CoreWidgets({super.key});

  @override
  Widget build(BuildContext context) {

      return Scaffold(
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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.network(
                  'https://phunuvietnam.mediacdn.vn/179072216278405120/2022/6/1/pororo-chim-canh-cut-be-nho-1-16540543152581223190933.jpg',
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  leading: Icon(Icons.star),
                  title: Text("Movie Item"),
                  subtitle: Text("This is a sample ListTile inside a Card."),
                ),
              ),
            ],
          ),
        ),
      );

  }
}
