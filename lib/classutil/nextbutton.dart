import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NxtButtn extends StatelessWidget {
  final String btntext;
  const NxtButtn({
    Key? key,
    required this.btntext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        bottom: 20,
      ),
      child: Container(
        width: double.infinity,
        // height: 45,
        decoration: BoxDecoration(
          color: Color(0xff4361EE),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              btntext,
              style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFFFFF)),
            ),
          ),
        ),
      ),
    );
  }
}
