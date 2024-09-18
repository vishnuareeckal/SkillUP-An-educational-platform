import 'package:login_page/class/modulee.dart';
import 'package:login_page/classwid/class2.dart';
import 'package:login_page/classwid/pages.dart';
import 'package:login_page/widgets/courses/python_class_1.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
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
      // bottomNavigationBar: NavBar(),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
          SingleChildScrollView(
            child: Column(
              children: [
                ModulePage(
                  txt: "Module 1",
                  destination1: PageClass(),
                  destination2: PageClass2(),
                  destination3: Chapter1(),
                  destination4: Chapter1(),
                  destination5: Chapter1(),
                ),
                ModulePage(
                  txt: "Module 2",
                  destination1: Chapter1(),
                  destination2: Chapter1(),
                  destination3: Chapter1(),
                  destination4: Chapter1(),
                  destination5: Chapter1(),
                ),
                ModulePage(
                  txt: "Module 3",
                  destination1: Chapter1(),
                  destination2: Chapter1(),
                  destination3: Chapter1(),
                  destination4: Chapter1(),
                  destination5: Chapter1(),
                ),
                ModulePage(
                  txt: "Module 4",
                  destination1: Chapter1(),
                  destination2: Chapter1(),
                  destination3: Chapter1(),
                  destination4: Chapter1(),
                  destination5: Chapter1(),
                ),
                ModulePage(
                  txt: "Module 5",
                  destination1: Chapter1(),
                  destination2: Chapter1(),
                  destination3: Chapter1(),
                  destination4: Chapter1(),
                  destination5: Chapter1(),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }

  // Widget content() {
  //   return
  // }
}
