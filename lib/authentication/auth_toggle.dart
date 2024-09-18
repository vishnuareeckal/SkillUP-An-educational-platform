import 'package:flutter/material.dart';
import 'package:login_page/authentication/login.dart';
import 'package:login_page/authentication/register.dart';

class AuthToggle extends StatefulWidget {
  @override
  _AuthToggleState createState() => _AuthToggleState();
}

class _AuthToggleState extends State<AuthToggle> {
  bool isLoginPage = true;

  void toggleView() {
    setState(() {
      isLoginPage = !isLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(isLoginPage ? 'Login' : 'Register'),
      // ),
      body: isLoginPage ? LoginPage() : RegisterPage(),
      bottomNavigationBar: BottomAppBar(
        height: 120,
        color: Color(0xfff3f3f3),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isLoginPage ? 'Not a member?' : 'Already a member?',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inter',
                  color: Color(0xff040404),
                ),
              ),
              TextButton(
                onPressed: toggleView,
                child: Text(
                  isLoginPage ? 'Register now' : 'Login',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter',
                    color: Color(0xff4361ee),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
