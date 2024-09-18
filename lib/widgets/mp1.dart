import 'package:flutter/material.dart';

class MaterialPage1 extends StatelessWidget {
  const MaterialPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff3f3f3),
      appBar: AppBar(
        title: Stack(
          children: <Widget>[
            ElevatedButton(
              style: ButtonStyle(
                //foregroundColor: MaterialStateProperty.all(Colors.white),
                backgroundColor: MaterialStateProperty.all(
                  Color(0xffdddddd),
                ),
                minimumSize: MaterialStateProperty.all(
                  Size(double.infinity, 36),
                ),
                textStyle: MaterialStateProperty.all(
                  TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color(
                      0xff303030,
                    ),
                    //color: Colors.red,
                  ),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              onPressed: () {
                showSearch(context: context, delegate: customSearchDelegate());
              },
              child: Row(
                children: const [
                  Icon(
                    Icons.search,
                    color: Color(0xff040404),
                    size: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8,
                      right: 8,
                    ),
                    child: Text(
                      "Search",
                      style: TextStyle(
                        color: Color(
                          0xff303030,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xfff3f3f3),
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(
              Icons.menu_rounded,
              color: Color(0xff040404),
              size: 30,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_rounded),
            color: Color(0xff040404),
            iconSize: 30,
            //padding: EdgeInsets.only(right: 20),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 12,
          ),
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
                          fontFamily: 'Inter'),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://i.ibb.co/m5zrWwR/Video.jpg'),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Videos",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff040404),
                              fontFamily: 'Inter',
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://i.ibb.co/nbHyS57/Study-ntoes.jpg'),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Study notes",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff040404),
                              fontFamily: 'Inter',
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://i.ibb.co/BLvcJ6P/Question-paper-1.jpg'),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Questions",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff040404),
                              fontFamily: 'Inter',
                            ),
                          )
                        ],
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

// ignore: camel_case_types
class customSearchDelegate extends SearchDelegate {
  List<String> searchItems = ['python', 'music', 'art', 'business'];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> mathQuery = [];
    for (var course in searchItems) {
      if (course.toLowerCase().contains(query.toLowerCase())) {
        mathQuery.add(course);
      }
    }
    return ListView.builder(
        itemCount: mathQuery.length,
        itemBuilder: (context, index) {
          var result = mathQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> mathQuery = [];
    for (var course in searchItems) {
      if (course.toLowerCase().contains(query.toLowerCase())) {
        mathQuery.add(course);
      }
    }
    return ListView.builder(
      itemCount: mathQuery.length,
      itemBuilder: (context, index) {
        var result = mathQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
