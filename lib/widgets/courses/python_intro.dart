import 'package:flutter/material.dart';
import 'package:login_page/class/demo.dart';
import 'package:login_page/widgets/courses/python_class.dart';

class PythonIntro extends StatelessWidget {
  const PythonIntro({super.key});

  // final List<String> texts = [
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff3f3f3),
      // bottomNavigationBar: BottomNavigationBar(
      //     items: [BottomNavigationBarItem(icon: Icon(Icons.home))]),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.white),
            backgroundColor: MaterialStateProperty.all(Color(0xff4361ee)),
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
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Demo();
            }));
          },
          child: Text("Go to course"),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xfff3f3f3),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Python for beginners",
          style: TextStyle(
              fontSize: 18,
              color: Color(0xff040404),
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 260,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/Python.png',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'What will I learn?',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter',
                    color: Color(0xff040404)),
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: content.length,
              itemBuilder: (context, int index) {
                return Column(
                  children: [
                    Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.circle,
                            size: 10,
                            color: Color(0xff040404),
                          ),
                          minLeadingWidth: 4,
                          dense: true,
                          visualDensity: VisualDensity(vertical: -3),
                          title: Text(
                            content[index].learn,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Inter',
                                color: Color(0xff040404)),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Target audience',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter',
                    color: Color(0xff040404)),
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: content.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.circle,
                            size: 10,
                            color: Color(0xff040404),
                          ),
                          minLeadingWidth: 4,
                          dense: true,
                          visualDensity: VisualDensity(vertical: -3),
                          title: Text(
                            content[index].audience,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Inter',
                                color: Color(0xff040404)),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Requirements',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter',
                    color: Color(0xff040404)),
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: content.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.circle,
                            size: 10,
                            color: Color(0xff040404),
                          ),
                          minLeadingWidth: 4,
                          dense: true,
                          visualDensity: VisualDensity(vertical: -3),
                          title: Text(
                            content[index].requirements,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Inter',
                                color: Color(0xff040404)),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Salary',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter',
                    color: Color(0xff040404)),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.circle,
                size: 10,
                color: Color(0xff040404),
              ),
              minLeadingWidth: 4,
              dense: true,
              visualDensity: VisualDensity(vertical: -3),
              title: Text(
                '700 USD',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Inter',
                    color: Color(0xff040404)),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                            image: AssetImage('assets/images/instructor.jpg'),
                            fit: BoxFit.cover)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32),
                    child: Text(
                      "Olivia Gerard",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.normal,
                          color: Color(0xff040404)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
