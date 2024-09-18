import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_page/authentication/auth_toggle.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  // void showAlert() {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff3f3f3),
        elevation: 0,
        title: Text(
          "Settings",
          style: TextStyle(
            fontSize: 16,
            color: Color(0xff040404),
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          Divider(
            height: 2,
            indent: 16,
            endIndent: 16,
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.notifications_rounded,
              size: 28,
              color: Color(0xff040404),
            ),
            title: Text(
              'Notifications',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                fontFamily: 'Inter',
                color: Color(0xff040404),
              ),
            ),
          ),
          Divider(
            height: 2,
            indent: 16,
            endIndent: 16,
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.volume_up_rounded,
              size: 28,
              color: Color(0xff040404),
            ),
            title: Text(
              'Sound',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                fontFamily: 'Inter',
                color: Color(0xff040404),
              ),
            ),
          ),
          Divider(
            height: 2,
            indent: 16,
            endIndent: 16,
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.policy_rounded,
              size: 28,
              color: Color(0xff040404),
            ),
            title: Text(
              'Terms and Privacy',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                fontFamily: 'Inter',
                color: Color(0xff040404),
              ),
            ),
          ),
          Divider(
            height: 2,
            indent: 16,
            endIndent: 16,
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.contact_support_rounded,
              size: 28,
              color: Color(0xff040404),
            ),
            title: Text(
              'FAQ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                fontFamily: 'Inter',
                color: Color(0xff040404),
              ),
            ),
          ),
          Divider(
            height: 2,
            indent: 16,
            endIndent: 16,
          ),
          ListTile(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => const CustomDialogWidget());
            },
            leading: Icon(
              Icons.power_settings_new_outlined,
              size: 28,
              color: Color(0xffDA1E37),
            ),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                fontFamily: 'Inter',
                color: Color(0xffDA1E37),
              ),
            ),
          ),
          Divider(
            height: 2,
            indent: 16,
            endIndent: 16,
          ),
        ],
      )),
    );
  }
}

class CustomDialogWidget extends StatelessWidget {
  const CustomDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 300,
        height: 328,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xffffffff),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 165,
              height: 165,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/logout avatar.png'))),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 4,
                bottom: 20,
                left: 20,
                right: 20,
              ),
              child: Center(
                child: Text(
                  'Are you sure, you want to logout?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xff040404),
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all(Color(0xffDA1E37)),
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xfff3f3f3)),
                    minimumSize: MaterialStateProperty.all(
                      Size(120, 35),
                    ),
                    textStyle: MaterialStateProperty.all(
                      TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter',
                        //color: Color(0xffDA1E37),
                      ),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel"),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xffDA1E37)),
                    minimumSize: MaterialStateProperty.all(
                      Size(120, 35),
                    ),
                    textStyle: MaterialStateProperty.all(
                      TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter'),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AuthToggle();
                    }));
                  },
                  child: Text("Logout"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
