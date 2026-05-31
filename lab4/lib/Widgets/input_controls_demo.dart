import 'package:flutter/material.dart';

class InputControlsDemo extends StatefulWidget {
  const InputControlsDemo({super.key});

  @override
  State<InputControlsDemo> createState() => _InputControlsDemoState();
}

class _InputControlsDemoState extends State<InputControlsDemo> {
  double _sliderValue = 50.0;
  bool _switchValue = false;
  String? _selectedGenre;
  DateTime? _selectedDate;


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Exercise 2 – Input Widgets")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Rating (Slider)", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Slider(
              value: _sliderValue,
              min: 0,
              max: 100,
              divisions: 10,
              label: _sliderValue.round().toString(),
              onChanged: (value) {
                setState(() { _sliderValue = value; });
              },
            ),
            Text("Current value: ${_sliderValue.round()}"),
            const SizedBox(height: 24),
            const Text(
                "Active (Switch)",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Is movie active?",
                  style: TextStyle(fontSize: 15),
                ),
                Switch(
                  value: _switchValue,
                  onChanged: (value) {
                    setState(() { _switchValue = value; });
                  },
                ),
              ],
            ),

            const SizedBox(height: 24),
            const Text(
              "Genre (RadioListTile)",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            RadioListTile<String>(
              title: const Text('Action'),
              value: 'Action',
              groupValue: _selectedGenre,
              onChanged: (value) {
                setState(() {
                  _selectedGenre = value!;
                });
              },
            ),

            RadioListTile<String>(
              title: const Text('Comedy'),
              value: 'Comedy',
              groupValue: _selectedGenre,
              onChanged: (value) {
                setState(() {
                  _selectedGenre = value!;
                });
              },
            ),

            Text(
              "Selected genre: ${_selectedGenre ?? 'None'}",
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _selectDate(context),
                child: const Text(
                  "Open Date Picker",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}