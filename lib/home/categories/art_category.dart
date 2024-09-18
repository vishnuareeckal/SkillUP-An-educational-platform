import 'package:flutter/material.dart';

class Art extends StatelessWidget {
  const Art({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff3f3f3),
      appBar: AppBar(
        backgroundColor: Color(0xfff3f3f3),
        elevation: 0,
        iconTheme: IconThemeData(
          color: Color(0xff040404),
        ),
        title: Text(
          "Art",
          style: TextStyle(
            fontSize: 20,
            color: Color(0xff040404),
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Center(
        child: Text(
          "To be updated!",
        ),
      ),
    );
  }
}
