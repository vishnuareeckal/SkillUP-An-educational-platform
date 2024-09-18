import 'package:flutter/material.dart';

class ClassesPage extends StatefulWidget {
  @override
  _ClassesPageState createState() => _ClassesPageState();
}

class _ClassesPageState extends State<ClassesPage> {
  int _currentIndex = 0;
  List<String> _linesOfText = [
    "This is the first sentence.",
    "This is the second sentence.",
    "This is the third sentence.",
    // Add more sentences as needed
  ];

  void _nextSentence() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _linesOfText.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Classes'),
      ),
      body: GestureDetector(
        onTap: _nextSentence,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              _linesOfText[_currentIndex],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
