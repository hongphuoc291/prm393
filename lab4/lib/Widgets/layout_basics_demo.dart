import 'package:flutter/material.dart';

class LayoutBasicsDemo extends StatelessWidget {
  LayoutBasicsDemo({super.key});

  final List<String> movies = [
    "Avatar",
    "Inception",
    "Interstellar",
    "Joker",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Exercise 3 – Layout Demo")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),

          const Center(
            child: Text(
              "Now Playing",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 16),

          Expanded(
            child: ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                String movieName = movies[index];
                String firstLetter = movieName.isNotEmpty ? movieName[0] : "";

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      leading: CircleAvatar(
                        backgroundColor: const Color(0xFFE2E1F9),
                        child: Text(
                          firstLetter,
                          style: const TextStyle(
                            color: Color(0xFF381E72),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      title: Text(
                        movieName,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      subtitle: const Text(
                        "Sample description",
                        style: TextStyle(fontSize: 13),
                      ),
                      onTap: () {},
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}