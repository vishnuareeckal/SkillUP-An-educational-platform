// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class TextOfContent {
  String introPara = "this is demo text to check is it gonna work! ";
}

class ProgressBar extends StatelessWidget {
  final double pervalue;
  const ProgressBar({super.key, required this.pervalue});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LinearPercentIndicator(
          animation: true,
          animationDuration: 1000,
          lineHeight: 4,
          percent: pervalue,
          progressColor: Color(0xff4361EE),
          backgroundColor: Color(0xffADADAD),
          barRadius: Radius.circular(50),
        )
      ],
    );
  }
}
