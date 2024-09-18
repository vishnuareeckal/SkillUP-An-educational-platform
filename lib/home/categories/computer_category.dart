import 'package:flutter/material.dart';
import 'package:login_page/widgets/courses/python_intro.dart';

class CourseCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final Widget destination;

  const CourseCard({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.destination,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0xfff3f3f3),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff040404),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 6),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff040404),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xff4361ee)),
                        minimumSize: MaterialStateProperty.all(
                          Size(112, 30),
                        ),
                        textStyle: MaterialStateProperty.all(
                          TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => destination,
                            ));
                      },
                      child: Text("Go to course"),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Computer extends StatelessWidget {
  const Computer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff3f3f3),
      appBar: AppBar(
        backgroundColor: Color(0xfff3f3f3),
        elevation: 0,
        iconTheme: IconThemeData(
          color: Color(0xff040404),
        ),
        title: Text(
          "Computer",
          style: TextStyle(
            fontSize: 20,
            color: Color(0xff040404),
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(height: 10),
            CourseCard(
              title: 'Python for beginners',
              subtitle: 'Web, data, AI, automation powerhouse.',
              imagePath: 'assets/images/Python.jpg',
              destination: PythonIntro(),
            ),
            SizedBox(height: 10),
            CourseCard(
              title: 'Flutter development',
              subtitle: 'Cross-platform framework for mobile app development.',
              imagePath: 'assets/images/Flutter.jpg',
              destination: PythonIntro(),
            ),
            SizedBox(height: 10),
            CourseCard(
              title: 'Machine learning',
              subtitle: 'Teaching machines to learn and adapt.',
              imagePath: 'assets/images/Machine learning.jpg',
              destination: PythonIntro(),
            ),
            SizedBox(height: 10),
            CourseCard(
              title: 'Web development',
              subtitle: 'Creating functional and interactive websites online.',
              imagePath: 'assets/images/Web development.jpg',
              destination: PythonIntro(),
            ),
            SizedBox(height: 10),
            CourseCard(
              title: 'UI/UX designing',
              subtitle: 'Enhancing user experience through intuitive design.',
              imagePath: 'assets/images/uiux.jpg',
              destination: PythonIntro(),
            ),
            SizedBox(height: 10),
            CourseCard(
              title: 'Swift',
              subtitle: 'Programming language for iOS and macOS.',
              imagePath: 'assets/images/Swift.jpg',
              destination: PythonIntro(),
            ),
            SizedBox(height: 10),
            CourseCard(
              title: 'Game development',
              subtitle:
                  'Creating interactive digital entertainment experiences.',
              imagePath: 'assets/images/Game.jpg',
              destination: PythonIntro(),
            ),
            SizedBox(height: 10),
            CourseCard(
              title: 'React native',
              subtitle:
                  'JavaScript framework for cross-platform mobile development.',
              imagePath: 'assets/images/React native.jpg',
              destination: PythonIntro(),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
