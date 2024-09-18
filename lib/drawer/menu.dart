import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_page/drawer/settings.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String _username = '';
  late String _lastName = '';
  late String _email = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        String uid = user.uid;
        DocumentSnapshot userDoc =
            await _firestore.collection('users').doc(uid).get();

        if (userDoc.exists) {
          setState(() {
            _username = userDoc.get('firstName');
            _lastName = userDoc.get('lastName');
            _email = user.email ?? ''; // Retrieve the user's email
          });
        }
      }
    } catch (e) {
      print("Error loading user data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: double.infinity,
      child: Container(
        color: Color(0xfff3f3f3),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/Python.jpg'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Center(
              child: Text(
                ' $_username $_lastName',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter',
                    color: Color(0xff040404)),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    '$_email',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Color(0xff040404),
                        fontFamily: 'Inter',
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 32,
            ),
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
    );
  }
}
