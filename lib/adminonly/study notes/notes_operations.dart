import 'package:flutter/material.dart';
import 'package:login_page/adminonly/study%20notes/list_notes.dart';
import 'package:login_page/adminonly/study%20notes/upload_notes.dart';

class NotesOperation extends StatelessWidget {
  const NotesOperation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'StudyNotes',
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
                return Listnote();
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
                  'All notes',
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
                return UploadNote();
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
                  'Upload notes',
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
