import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page/classutil/progressbar.dart';

class ClassPage extends StatelessWidget {
  final String chapterName;
  final double perBarVal;
  final String content;
  final PageController pageController;
  final String imagePath;

  const ClassPage({
    Key? key,
    required this.chapterName,
    required this.perBarVal,
    required this.content,
    required this.pageController,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff3f3f3),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Color(0xff4361ee)),
            backgroundColor: MaterialStateProperty.all(Color(0xfff3f3f3)),
            minimumSize: MaterialStateProperty.all(
              Size(double.infinity, 56),
            ),
            textStyle: MaterialStateProperty.all(
              TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inter'),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          onPressed: () {
            print("clicked");
            pageController.nextPage(
              duration: Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          },
          child: Text("Tap to continue"),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios_rounded),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.volume_up_rounded),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProgressBar(
                pervalue: perBarVal,
              ),
            ),
            Center(
              child: Text(
                chapterName,
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 260,
              width: double.infinity,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                content,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // SizedBox(height: 164), // Gap between button and above content
            // GestureDetector(
            //   onTap: () {
            //     print("clicked");
            //     pageController.nextPage(
            //       duration: Duration(milliseconds: 500),
            //       curve: Curves.ease,
            //     );
            //   },
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 16),
            //     child: Container(
            //       height: 56,
            //       padding: const EdgeInsets.all(8.0),
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(16),
            //         color: Color(0xff4361EE),
            //       ),
            //       child: Center(
            //         child: Text(
            //           "Tap to continue",
            //           style: GoogleFonts.inter(
            //             color: Colors.white,
            //             fontWeight: FontWeight.bold,
            //           ),
            //           textAlign: TextAlign.center,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
