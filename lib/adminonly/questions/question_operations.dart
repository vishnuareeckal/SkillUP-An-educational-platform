import 'package:flutter/material.dart';
import 'package:login_page/adminonly/questions/list_questions.dart';
import 'package:login_page/adminonly/questions/upload_questions.dart';

class Questions extends StatelessWidget {
  const Questions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Question Papers',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 18,
          ),
        ),
        foregroundColor: Color(0xfff3f3f3),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        children: [
          //showall
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ListQuestions();
              }));
            },
            child: Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  'All questions',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter'),
                ),
              ),
            ),
          ),
          //uploadfile
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return UploadQuestions();
              }));
            },
            child: Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  'Upload questions',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
