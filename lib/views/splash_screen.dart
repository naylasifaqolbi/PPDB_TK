import 'dart:async';
import 'package:flutter/material.dart';
import 'landing_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Pindah otomatis ke landing page setelah 10 detik
    Timer(const Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LandingPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Stack(
        children: [
          // Tengah layar
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Logo TK
                Image.asset('assets/images/logo.png', width: 180, height: 180),

                const SizedBox(height: 15),

                // Nama aplikasi
                const Text(
                  'NH SMART PPDB',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),

          // Bagian bawah
          Align(
            alignment: Alignment.bottomCenter,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                // Lahan hijau
                Image.asset(
                  'assets/images/padang_hijau.png',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                // Anak bahagia
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Image.asset(
                    'assets/images/anak_bahagia.png',
                    width: 350,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
