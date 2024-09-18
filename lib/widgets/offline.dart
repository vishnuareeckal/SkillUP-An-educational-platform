import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Offline extends StatefulWidget {
  const Offline({super.key});

  @override
  State<Offline> createState() => _OfflineState();
}

class _OfflineState extends State<Offline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff3f3f3),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/offline.json'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'Check your connection',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    color: Color(0xff040404),
                    fontWeight: FontWeight.normal),
              ),
            )
          ],
        ),
      ),
    );
  }
}
