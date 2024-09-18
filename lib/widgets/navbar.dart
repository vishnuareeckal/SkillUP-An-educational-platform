import 'package:flutter/material.dart';
import 'package:login_page/home/homepage.dart';
import 'package:login_page/materials/materials.dart';
import 'package:login_page/widgets/progress.dart';

class NavBar extends StatefulWidget {
  NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;

  List<Widget> body = const [
    HomePage(),
    ProgressPage(),
    Materials(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff3f3f3),
      body: Center(
        child: body[_currentIndex],
      ),
      bottomNavigationBar: Container(
        height: 64,
        child: BottomNavigationBar(
          iconSize: 28,
          selectedLabelStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            fontFamily: 'Inter',
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            fontFamily: 'Inter',
          ),
          selectedItemColor: Color(0xff4361ee),
          currentIndex: _currentIndex,
          onTap: (int newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Padding(
                padding: EdgeInsets.only(bottom: 2),
                child: Icon(Icons.home_rounded),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Progress',
              icon: Padding(
                padding: EdgeInsets.only(bottom: 2),
                child: Icon(Icons.fact_check_rounded),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Materials',
              icon: Padding(
                padding: EdgeInsets.only(bottom: 2),
                child: Icon(Icons.school_rounded),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
