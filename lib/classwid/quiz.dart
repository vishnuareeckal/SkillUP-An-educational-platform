import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page/class/demo.dart';
import 'package:login_page/classutil/progressbar.dart';
import 'package:login_page/classutil/question_model.dart';

class Quiz extends StatefulWidget {
  final double perBarVal;
  const Quiz({
    super.key,
    required this.perBarVal,
  });

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<Questions> questionList = getQuestions();
  int currentQuestionIndex = 0;
  Answer? selectedAnswer;
  @override
  Widget build(BuildContext context) {
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
                      pervalue: widget.perBarVal,
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
                      questionList[currentQuestionIndex].questionText,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  _answerList(),
                ],
              ),
              //the whole colmn
              Column(
                children: [
                  _nxtbutton(),
                ],
              )
            ]),
      ),
    );
  }

  Widget _answerList() {
    return Column(
      children: questionList[currentQuestionIndex]
          .answerList
          .map((e) => _answerButton(e))
          .toList(),
    );
  }

  Widget _answerButton(Answer answer) {
    bool isSelected = answer == selectedAnswer;
    bool isCorrectAns = answer.isCorrect == isSelected;
    bool showBorder = selectedAnswer != null;
    bool isIncorrectSelected = isSelected && !isCorrectAns;
    bool isCorrectSelected = isSelected && isCorrectAns;

    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 16,
      ),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedAnswer = answer;
          });
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: showBorder
                  ? isCorrectSelected
                      ? Colors.green
                      : isIncorrectSelected
                          ? Colors.red
                          : Colors.grey
                  : Colors.grey,
              width: 2,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                answer.answerText,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isSelected
                      ? isCorrectAns
                          ? Colors.green
                          : Colors.red
                      : Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _nxtbutton() {
    bool isLastQuestion = false;
    if (currentQuestionIndex == questionList.length - 1) {
      isLastQuestion = true;
    }
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        bottom: 20,
      ),
      child: GestureDetector(
        onTap: () {
          if (isLastQuestion) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Demo();
            }));
          } else {
            setState(() {
              selectedAnswer = null;
              currentQuestionIndex++;
            });
          }
        },
        child: Container(
          width: double.infinity,
          // height: 45,
          decoration: BoxDecoration(
            color: const Color(0xff4361EE),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                isLastQuestion ? "Finish" : "Next",
                style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFFFFFFF)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
