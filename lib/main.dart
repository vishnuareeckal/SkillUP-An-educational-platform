import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:login_page/controller/dependency_injection.dart';
import 'package:login_page/firebase_options.dart';
import 'package:login_page/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  DependencyInjection.init();
  User? user = await FirebaseAuth.instance.authStateChanges().first;

  if (user != null) {
    // User is signed in
    String userId = user.uid;
    String? userEmail = user.email;
    print('User ID: $userId');
    print('User email: $userEmail');
  } else {
    // No user is signed in
    print('No user is signed in');
  }
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
  );
  runApp(
    GetMaterialApp(
      title: "SkillUP",
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Color(0xff4361ee)),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ),
  );
}
