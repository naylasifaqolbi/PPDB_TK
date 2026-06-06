import 'dart:async';
import 'package:flutter/material.dart';
import '../views/landing_page.dart';

class SplashViewModel extends ChangeNotifier {
  void startSplash(BuildContext context) {
    Timer(const Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LandingPage()),
      );
    });
  }
}
