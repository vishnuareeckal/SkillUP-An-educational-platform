// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page/classutil/answertile.dart';
import 'package:login_page/classutil/nextbutton.dart';
import 'package:login_page/classutil/progressbar.dart';

class QuizCheck extends StatelessWidget {
  final double perBarVal;
  const QuizCheck({
    super.key,
    required this.perBarVal,
  });

  @override
  Widget build(BuildContext context) {
    Color brclr = Colors.grey;
    Color green = Colors.green;
    Color red = Colors.red;
    Color black = Colors.black;
    return Scaffold(
      backgroundColor: const Color(0xfff3f3f3),
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 8,
                    ),
                    child: ProgressBar(
                      pervalue: perBarVal,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 4.0,
                      left: 4.0,
                      right: 4.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios_rounded,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.volume_up_rounded,
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                  Center(
                    child: Text(
                      "Let's summarize",
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      left: 25.0,
                      right: 25.0,
                      bottom: 4,
                    ),
                    child: Text(
                      "Who is the founder of python programming language?",
                      style: GoogleFonts.inter(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  AnswerTile(
                    answertext: "Bjarne Stroustrup",
                    bcolor: red,
                    anscolor: red,
                  ),
                  AnswerTile(
                    answertext: "Guido van Rossum",
                    bcolor: green,
                    anscolor: green,
                  ),
                  AnswerTile(
                    answertext: "Brendan Eich",
                    bcolor: red,
                    anscolor: red,
                  ),
                ],
              ),
              Column(
                children: [
                  NxtButtn(
                    btntext: "Next",
                  )
                ],
              )
            ]),
      ),
    );
  }
}
