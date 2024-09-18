import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_page/drawer/settings.dart';
import 'package:login_page/home/homepage.dart';
import 'package:login_page/materials/materials.dart';
import 'package:login_page/widgets/progress.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String _username = '';
  late String _lastName = '';
  late String _email = '';
  bool _isAvatar1Selected = true;
  int _currentIndex = 0;

  List<Widget> body = const [
    HomePage(),
    ProgressPage(),
    Materials(),
  ];

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      User? user = _auth.currentUser;

      if (user != null && mounted) {
        String uid = user.uid;
        DocumentSnapshot userDoc =
            await _firestore.collection('users').doc(uid).get();

        if (mounted) {
          // Check if the widget is still mounted before calling setState
          setState(() {
            _username = userDoc.get('firstName');
            _lastName = userDoc.get('lastName');
            _email = user.email ?? '';
          });
        }
      }
    } catch (e) {
      print("Error loading user data: $e");
    }
  }

  Future<void> _showChangeAvatarDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Change Avatar'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('Joe'),
                onTap: () {
                  _updateAvatar(true);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Jessy'),
                onTap: () {
                  _updateAvatar(false);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _updateAvatar(bool isAvatar1Selected) {
    setState(() {
      _isAvatar1Selected = isAvatar1Selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            // Avatar Section
            GestureDetector(
              onTap: () => _showChangeAvatarDialog(),
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: _isAvatar1Selected
                          ? AssetImage('assets/images/male_avatar.png')
                          : AssetImage('assets/images/female_avatar.png'),
                      radius: 60,
                    ),
                  ],
                ),
              ),
            ),
            // User Information
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      ' $_username $_lastName',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter',
                        color: Color(0xff040404),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '$_email',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Color(0xff040404),
                        fontFamily: 'Inter',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            // Drawer Items
            const Divider(
              height: 2,
              indent: 16,
              endIndent: 16,
            ),
            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SettingsPage();
                }));
              },
              leading: Icon(
                Icons.settings_rounded,
                size: 28,
                color: Color(0xff040404),
              ),
              title: Text(
                'Settings',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Inter',
                  color: Color(0xff040404),
                ),
              ),
            ),
            const Divider(
              height: 2,
              indent: 16,
              endIndent: 16,
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.person_add_alt_1_rounded,
                size: 28,
                color: Color(0xff040404),
              ),
              title: Text(
                'Invite friends',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Inter',
                  color: Color(0xff040404),
                ),
              ),
            ),
            const Divider(
              height: 2,
              indent: 16,
              endIndent: 16,
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.star_half_outlined,
                size: 28,
                color: Color(0xff040404),
              ),
              title: Text(
                'Rate us',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Inter',
                  color: Color(0xff040404),
                ),
              ),
            ),
            const Divider(
              height: 2,
              indent: 16,
              endIndent: 16,
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.help_rounded,
                size: 28,
                color: Color(0xff040404),
              ),
              title: Text(
                'Get help',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Inter',
                  color: Color(0xff040404),
                ),
              ),
            ),
            const Divider(
              height: 2,
              indent: 16,
              endIndent: 16,
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.dark_mode_rounded,
                size: 28,
                color: Color(0xff040404),
              ),
              title: Text(
                'Dark mode',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Inter',
                  color: Color(0xff040404),
                ),
              ),
            ),
            const Divider(
              height: 2,
              indent: 16,
              endIndent: 16,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 64,
        child: BottomNavigationBar(
          iconSize: 28,
          selectedLabelStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            fontFamily: 'Inter',
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            fontFamily: 'Inter',
          ),
          selectedItemColor: Color(0xff4361ee),
          currentIndex: _currentIndex,
          onTap: (int newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Padding(
                padding: EdgeInsets.only(bottom: 2),
                child: Icon(Icons.home_rounded),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Progress',
              icon: Padding(
                padding: EdgeInsets.only(bottom: 2),
                child: Icon(Icons.fact_check_rounded),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Materials',
              icon: Padding(
                padding: EdgeInsets.only(bottom: 2),
                child: Icon(Icons.school_rounded),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        foregroundColor: Color(0xfff3f3f3),
        backgroundColor: Color(0xff4361ee),
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Color(0xfff3f3f3)),
        title: Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'SkillUP',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter',
                    color: Color(0xfff3f3f3),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: Icon(
                    Icons.search_rounded,
                    color: Color(0xfff3f3f3),
                    size: 28,
                  ),
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: CustomSearchDelegate(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      body: body[_currentIndex],
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchItems = ['python', 'music', 'art', 'business'];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back_ios),
    );
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
      },
    );
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
