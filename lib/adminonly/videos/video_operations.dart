import 'package:flutter/material.dart';
import 'package:login_page/adminonly/videos/list_video.dart';
import 'package:login_page/adminonly/videos/upload_video.dart';

class VideoOperations extends StatelessWidget {
  const VideoOperations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Color(0xfff3f3f3),
        title: Text(
          'Videos',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 18,
          ),
        ),
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
                return ListVideo();
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
                  'All videos',
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
                return UploadVideo();
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
                  'Upload video',
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
