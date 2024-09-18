// import 'dart:developer';
// ignore_for_file: non_constant_identifier_names

//import 'package:to_do/components/modules.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';
import 'package:login_page/widgets/courses/module.dart';

class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  // final List _module = [
  //   "Module 1",
  //   "Module 2",
  //   "Module 3",
  //   "Module 4",
  //   "Module 5",
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff3f3f3),
      appBar: AppBar(
        backgroundColor: Color(0xfff3f3f3),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 24,
              color: Color(0xff040404),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          "Python for Beginners",
          style: GoogleFonts.inter(
            fontSize: 20,
            color: Color(0xff040404),
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Text(
                "Index",
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Module(),
            Module(),
            Module(),
          ],
        ),
      ),
    );
  }

  // Widget content() {
  //   return
  // }
}
