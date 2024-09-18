import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerTile extends StatelessWidget {
  final String answertext;
  final Color bcolor;
  final Color anscolor;
  const AnswerTile({
    Key? key,
    required this.answertext,
    required this.bcolor,
    required this.anscolor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 16,
      ),
      child: Container(
        width: double.infinity,
        // height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: bcolor,
            width: 2,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              answertext,
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
