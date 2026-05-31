import 'package:flutter/material.dart';
import 'Widgets/core_widgets_demo.dart';
import 'package:lab4/Widgets/input_controls_demo.dart';
import 'package:lab4/Widgets/layout_basics_demo.dart';
import 'package:lab4/Widgets/app_structure_demo.dart';
import 'package:lab4/Widgets/fix_common_errors.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: MainMenuScreen(isDarkMode: _isDarkMode, onToggleTheme: _toggleTheme),
    );
  }
}

class MainMenuScreen extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const MainMenuScreen({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {
        "title": "Exercise 1 – Core Widgets Demo",
        "buildTarget": (BuildContext context) => const CoreWidgets(),
      },
      {
        "title": "Exercise 2 – Input Controls Demo",
        "buildTarget": (BuildContext context) => const InputControlsDemo(),
      },
      {
        "title": "Exercise 3 – Layout Demo",
        "buildTarget": (BuildContext context) => LayoutBasicsDemo(),
      },
      {
        "title": "Exercise 4 – App Structure & Theme",
        "buildTarget": (BuildContext context) => AppStructureDemo(isDarkMode: isDarkMode, onToggleTheme: onToggleTheme),
      },
      {
        "title": "Exercise 5 – Common UI Fixes",
        "buildTarget": (BuildContext context) => const CommonFixesDemo(),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lab 4 – Flutter UI Fundamentals"),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: ListView.builder(
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  title: Text(
                    menuItems[index]["title"],
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => menuItems[index]["buildTarget"](context),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}