import 'package:flutter/material.dart';
import 'package:login_page/widgets/courses/python_intro.dart';

class Computer extends StatelessWidget {
  const Computer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff3f3f3),
      appBar: AppBar(
        backgroundColor: Color(0xfff3f3f3),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 24,
              color: Color(0xff040404),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          "Computer",
          style: TextStyle(
              fontSize: 20,
              color: Color(0xff040404),
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
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
                ),
                child: Container(
                  decoration: BoxDecoration(boxShadow: const [
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
                  ]),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 6,
                        child: Container(
                          // width: MediaQuery.of(context).size.width * 0.53,
                          decoration: BoxDecoration(
                              color: Color(0xfff3f3f3),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                bottomLeft: Radius.circular(16),
                              )),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 16.0,
                                  bottom: 8,
                                  left: 12,
                                  right: 12,
                                ),
                                child: Expanded(
                                  child: Text(
                                    'Python for beginners',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Inter',
                                      color: Color(0xff040404),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                child: Expanded(
                                  child: Text(
                                    'Web, data, AI, automation powerhouse.',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Inter',
                                      color: Color(0xff040404),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 0,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all(Colors.white),
                                    backgroundColor: MaterialStateProperty.all(
                                        Color(0xff4361ee)),
                                    minimumSize: MaterialStateProperty.all(
                                      Size(115, 32),
                                    ),
                                    textStyle: MaterialStateProperty.all(
                                      TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Inter'),
                                    ),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return PythonIntro();
                                    }));
                                  },
                                  child: Text("Go to course"),
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
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                            ),
                            image: DecorationImage(
                                image: AssetImage('assets/images/Python.jpg'),
                                fit: BoxFit.cover),
                          ),
                          //width: MediaQuery.of(context).size.width * 0.36,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
