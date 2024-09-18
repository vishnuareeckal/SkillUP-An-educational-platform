import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:login_page/home/categories/agriculture_category.dart';
import 'package:login_page/home/categories/art_category.dart';
import 'package:login_page/home/categories/computer_category.dart';
import 'package:login_page/home/categories/music_category.dart';
import 'package:login_page/home/categories/science_category.dart';
import 'package:login_page/home/categories/business_category.dart';
import 'package:login_page/widgets/courses/python_intro.dart';

class HomePage extends StatelessWidget {
  const HomePage({key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff3f3f3),
        body: FutureBuilder<bool>(
          future: _requestPermission(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.data == true) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 12),
                    SizedBox(
                      height: 90,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          buildCategory(
                            'Computer',
                            'assets/images/Computer 3d.jpg',
                            Computer(),
                            context,
                          ),
                          buildCategory(
                            'Business',
                            'assets/images/Business card 1.jpg',
                            Business(),
                            context,
                          ),
                          buildCategory(
                            'Music',
                            'assets/images/Music card 2.jpg',
                            Music(),
                            context,
                          ),
                          buildCategory(
                            'Art',
                            'assets/images/art.jpg',
                            Art(),
                            context,
                          ),
                          buildCategory(
                            'Science',
                            'assets/images/science.jpg',
                            Science(),
                            context,
                          ),
                          buildCategory(
                            'Agriculture',
                            'assets/images/agriculture.jpg',
                            Agriculture(),
                            context,
                          ),
                        ],
                      ),
                    ),
                    buildSectionTitle('Trending courses'),
                    buildCourseCard(
                      'Python for beginners',
                      'Web, Data, AI, Automation powerhouse',
                      'assets/images/Python.jpg',
                      PythonIntro(),
                    ),
                    SizedBox(height: 8),
                    buildCourseCard(
                      'Artificial Intelligence',
                      'Intelligence beyond human boundaries',
                      'assets/images/AI Card 1.jpg',
                      PythonIntro(),
                    ),
                    SizedBox(height: 8),
                    buildCourseCard(
                      'React Native',
                      'Cross-platform mobile app development',
                      'assets/images/React native.jpg',
                      PythonIntro(),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              );
            } else {
              return Center(
                child: Text(
                  'Permission to access storage is required.',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget buildCategory(String title, String imagePath, Widget destination,
      BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => destination,
                ),
              );
            },
            child: Container(
              width: 68,
              height: 68,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontFamily: 'Inter',
              color: Color(0xff040404),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          fontFamily: 'Inter',
          color: Color(0xff040404),
        ),
      ),
    );
  }

  Widget buildCourseCard(
      String title, String subtitle, String imagePath, Widget destination) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        elevation: 4,
        borderOnForeground: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inter',
                  color: Color(0xff4361ee),
                ),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                subtitle,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inter',
                  color: Color(0xff040404),
                ),
              ),
            ),
            SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry...',
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Inter',
                  color: Color(0xff363636),
                ),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Builder(
                builder: (BuildContext buttonContext) {
                  return ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
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
                          buttonContext,
                          MaterialPageRoute(
                            builder: (context) => destination,
                          ));
                    },
                    child: Text("Read more"),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Future<bool> _requestPermission() async {
    var status = await Permission.storage.request();
    return status.isGranted;
  }
}
