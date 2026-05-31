import 'package:flutter/material.dart';

class AppStructureDemo extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const AppStructureDemo({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  @override
  State<AppStructureDemo> createState() => _AppStructureDemoState();
}

class _AppStructureDemoState extends State<AppStructureDemo> {
  late bool _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.isDarkMode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exercise 4 - App Structure and Theme"),
        actions: [
          Switch(
            value: _currentValue,
            onChanged: (value) {
              setState(() {
                _currentValue = value;
              });
              widget.onToggleTheme();
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "This is a simple screen with theme toggle",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: _currentValue ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}