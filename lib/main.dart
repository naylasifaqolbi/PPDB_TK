import 'package:flutter/material.dart';
import 'views/splash_screen.dart';
import 'views/status_page.dart';
import 'views/form_pendaftaran_page.dart';
import 'views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NH SMART PPDB',
      home: const SplashScreen(),
      routes: {
        '/home': (context) => const HomePage(),
        '/status': (context) => const StatusPage(),
        '/form_pendaftaran': (context) => const FormPendaftaranPage(),
      },
    );
  }
}