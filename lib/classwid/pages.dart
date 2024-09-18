import 'package:flutter/material.dart';
import 'package:login_page/classwid/class.dart';
import 'package:login_page/classwid/quiz.dart';
import 'package:login_page/classwid/quizcheck.dart';

// ignore: must_be_immutable
class PageClass extends StatelessWidget {
  final PageController pageController = PageController();
  List<Widget> classes = [];

  PageClass({Key? key}) : super(key: key) {
    classes = [
      ClassPage(
        chapterName: "Introduction",
        perBarVal: 0.1,
        content:
            "If you are wondering what is the world is programming?. Then stick till the end of the topic.",
        pageController: pageController,
        imagePath: "assets/images/intro1.1.jpg",
      ),
      ClassPage(
        chapterName: "Introduction",
        perBarVal: 0.2,
        content:
            "Imagine you are playing with your dog and you instruct him to bring the ball that you just threw. Dog will surely run towards the ball and fetch it for you.",
        pageController: pageController,
        imagePath: "assets/images/intro1.2.jpg",
      ),
      ClassPage(
        chapterName: "Introduction",
        perBarVal: 0.3,
        content:
            "You might be thinking what this example has to do with programming.  So,let me tell you what you did was just instructed the dog to accomplish a task.That is you just 'Programmed'Your dog to do so.",
        pageController: pageController,
        imagePath: "assets/images/intro1.3.jpg",
      ),
      Quiz(perBarVal: .4),
      QuizCheck(perBarVal: .5),
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
