import 'package:flutter/material.dart';
import 'package:login_page/class/demo.dart';

class ProgressCard extends StatelessWidget {
  final String course;
  final String module;
  final String topic;
  final String imagePath;
  final Widget destination;
  final double progress;

  const ProgressCard({
    required this.course,
    required this.module,
    required this.topic,
    required this.imagePath,
    required this.destination,
    this.progress = 0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 180,
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
                      course,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff040404),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: LinearProgressIndicator(
                              value: progress,
                              backgroundColor: Color(0xffd0d0d0),
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xff4361ee)),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          '${(progress * 100).toInt()}%',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff4361ee),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6),
                    Text(
                      module,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff040404),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4),
                    Text(
                      topic,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Color(0xff040404),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => destination,
                          ),
                        );
                      },
                      child: Container(
                        width: 112,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.5,
                            color: Color(0xff4361ee),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            "Continue",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff4361ee),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xfff3f3f3),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  image: DecorationImage(
                    scale: 4,
                    image: AssetImage(imagePath),
                    fit: BoxFit.scaleDown,
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

class ProgressPage extends StatelessWidget {
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff3f3f3),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(height: 10),
            ProgressCard(
              course: 'Python for beginners',
              progress: 0.15,
              module: 'Module 1',
              topic: 'Variables and Keywords',
              imagePath: 'assets/images/Learning.png',
              destination: Demo(),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
