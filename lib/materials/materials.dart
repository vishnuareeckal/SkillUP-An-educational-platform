import 'package:flutter/material.dart';
import 'package:login_page/materials/notes_download.dart';
import 'package:login_page/materials/qp_download.dart';
import 'package:login_page/materials/video_download.dart';

class MaterialItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback onTap;

  const MaterialItem({
    required this.imagePath,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Color(0xff040404),
            fontFamily: 'Inter',
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class Materials extends StatelessWidget {
  const Materials({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff3f3f3),
      body: Column(
        children: [
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              width: double.infinity,
              height: 168,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(24, 24, 24, 1200),
                    offset: Offset(4, 4),
                    blurRadius: 20,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4, -4),
                    blurRadius: 20,
                  ),
                ],
                borderRadius: BorderRadius.circular(16),
                color: Color(0xfff5f5f5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Python for beginners",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff040404),
                        fontFamily: 'Inter',
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MaterialItem(
                        imagePath: 'assets/images/Video.jpg',
                        title: 'Videos',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return vDownload();
                            }),
                          );
                        },
                      ),
                      MaterialItem(
                        imagePath: 'assets/images/Study notes.jpg',
                        title: 'Study notes',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return nDownload();
                            }),
                          );
                        },
                      ),
                      MaterialItem(
                        imagePath: 'assets/images/Questions.jpg',
                        title: 'Questions',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return QpDownload();
                            }),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
