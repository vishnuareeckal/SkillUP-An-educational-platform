import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_page/authentication/auth_toggle.dart';
import 'package:login_page/main_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoggedInStatus();
  }

  _checkLoggedInStatus() async {
    await Future.delayed(Duration(seconds: 3)); // Simulate splash screen delay

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => MainPage(),
        ),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => AuthToggle(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Color(0xff4361ee),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  'skillUP',
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                    fontFamily: "Myriad",
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
