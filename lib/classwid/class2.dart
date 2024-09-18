import 'package:flutter/material.dart';
import 'package:login_page/classwid/class.dart';
import 'package:login_page/classwid/quiz_2.dart';

// ignore: must_be_immutable
class PageClass2 extends StatelessWidget {
  final PageController pageController = PageController();
  List<Widget> classes = [];

  PageClass2({Key? key}) : super(key: key) {
    classes = [
      ClassPage(
        chapterName: "Python",
        perBarVal: 0.1,
        content:
            "Python is a high-level, general-purpose programming language. Its design philosophy emphasizes code readability with the use of significant indentation. Python is dynamically typed and garbage-collected. It supports multiple programming paradigms, including structured, object-oriented and functional programming.",
        pageController: pageController,
        imagePath: "assets/images/img.jpg.png",
      ),
      ClassPage(
        chapterName: "Easy to Code",
        perBarVal: 0.2,
        content:
            "Python is a very high-level programming language, yet it is effortless to learn. Anyone can learn to code in Python in just a few hours or a few days",
        pageController: pageController,
        imagePath: "assets/images/img2.1.jpg",
      ),
      ClassPage(
        chapterName: "Easy to Read",
        perBarVal: 0.3,
        content:
            "Python code looks like simple English words. There is no use of semicolons or brackets, and the indentations define the code block. You can tell what the code is supposed to do simply by looking at it.",
        pageController: pageController,
        imagePath: "assets/images/img2.2.jpg",
      ),
      ClassPage(
        chapterName: "Free and Open-Source",
        perBarVal: .4,
        content:
            "Python is developed under an OSI-approved open source license. Hence, it is completely free to use, even for commercial purposes",
        pageController: pageController,
        imagePath: "assets/images/img2.3.jpg",
      ),
      ClassPage(
        chapterName: "Robust Standard Library",
        perBarVal: .5,
        content:
            "Python has an extensive standard library available for anyone to use. This means that programmers don't have to write their code for every single thing unlike other programming languages",
        pageController: pageController,
        imagePath: "assets/images/intro.png",
      ),
      ClassPage(
        chapterName: "Interpreted",
        perBarVal: .6,
        content:
            "When a programming language is interpreted, it means that the source code is executed line by line, and not all at once.",
        pageController: pageController,
        imagePath: "assets/images/intro.png",
      ),
      ClassPage(
        chapterName: "Portable",
        perBarVal: .7,
        content:
            "Python is portable in the sense that the same code can be used on different machines.",
        pageController: pageController,
        imagePath: "assets/images/intro.png",
      ),
      ClassPage(
        chapterName: "Object-Oriented and Procedure-Oriented",
        perBarVal: .8,
        content:
            "A programming language is object-oriented if it focuses design around data and objects, rather than functions and logic",
        pageController: pageController,
        imagePath: "assets/images/intro.png",
      ),
      ClassPage(
        chapterName: "Extensible",
        perBarVal: .9,
        content:
            "A programming language is said to be extensible if it can be extended to other languages",
        pageController: pageController,
        imagePath: "assets/images/intro.png",
      ),
      Quiz2(perBarVal: 1),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: pageController,
          children: classes,
        ),
      ),
    );
  }
}
