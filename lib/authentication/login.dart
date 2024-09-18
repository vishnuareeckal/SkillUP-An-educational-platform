import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:login_page/adminonly/dashboard.dart';
import 'package:login_page/authentication/forgot_pass.dart';
import 'package:login_page/main_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;
  bool isObscure = true;

  void _togglePasswordVisibility() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  Future<void> _login() async {
    setState(() {
      isLoading = true;
    });

    try {
      if (_emailController.text.trim().isEmpty ||
          _passwordController.text.length < 6) {
        _showSnackbar(
          'Please enter a valid email and password (min. 6 characters).',
          backgroundColor: Color(0xffDA1E37),
        );
        return;
      }

      if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
          .hasMatch(_emailController.text.trim())) {
        _showSnackbar(
          'Please enter a valid email address',
          backgroundColor: Color(0xffDA1E37),
        );
        return;
      }

      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      String userRole = await getUserRole(userCredential.user!.uid);

      if (userRole == 'admin') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Dashboard()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainPage()),
        );
      }
    } on FirebaseAuthException catch (e) {
      print("Firebase Auth Error: ${e.code}");

      if (e.code == 'user-not-found') {
        _showSnackbar(
          'Wrong password. Please try again.',
          backgroundColor: Color(0xffDA1E37),
        );
      } else {
        _showSnackbar(
          'Error occurred. Please try again later.',
          backgroundColor: Color(0xffDA1E37),
        );
      }
    } catch (e) {
      print("Error: $e");
      _showSnackbar(
        'Error occurred. Please try again later.',
        backgroundColor: Color(0xffDA1E37),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<String> getUserRole(String uid) async {
    try {
      DocumentSnapshot userDoc =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      if (userDoc.exists) {
        return userDoc.get('role').toString();
      } else {
        // Handle case where user document is not found
        print('User document not found for UID: $uid');
        return 'user'; // Default role if document is not found
      }
    } catch (e) {
      print("Error fetching user role: $e");
      return 'user'; // Default role in case of an error
    }
  }

  void _showSnackbar(String message, {Color backgroundColor = Colors.red}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff3f3f3),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Welcome back!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter',
                    color: Color(0xff040404),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'Enter email',
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(isObscure
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: _togglePasswordVisibility,
                        ),
                        hintText: 'Enter password',
                        border: InputBorder.none,
                      ),
                      obscureText: isObscure,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPasswordScreen()),
                        );
                      },
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Inter',
                          color: Color(0xff040404),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 28,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GestureDetector(
                  onTap: _login,
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Color(0xff4361ee),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Container(), // Loading indicator
            ],
          ),
        ),
      ),
    );
  }
}
