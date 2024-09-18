import 'package:flutter/material.dart';
import 'package:login_page/main_page.dart';

class CourseComplete extends StatelessWidget {
  const CourseComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "You’ve successfully completed the course",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xff040404),
                fontFamily: 'Inter',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              "Python for beginners",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xff4361ee),
                fontFamily: 'Inter',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 252,
              height: 252,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(500),
                  color: Color(0xff8c8c8c),
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://i.ibb.co/8K18XF4/Finish-course.png"))),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.white),
                backgroundColor: MaterialStateProperty.all(Color(0xff4361ee)),
                minimumSize: MaterialStateProperty.all(
                  Size(120, 35),
                ),
                textStyle: MaterialStateProperty.all(
                  TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter'),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MainPage();
                }));
              },
              child: Text("Home"),
            ),
          ],
        ),
      ),
    );
  }
}
