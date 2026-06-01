import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF7FF),

      body: SafeArea(
        child: Stack(
          children: [
            // Rumput kiri bawah
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset('assets/images/rumput.png', width: 105),
            ),

            // Rumput kanan bawah (tidak mirror)
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset('assets/images/rumput2.png', width: 105),
            ),

            Column(
              children: [
                const SizedBox(height: 18),

                // Logo kecil atas
                Image.asset('assets/images/logo.png', width: 55),

                const SizedBox(height: 18),

                // Text welcome
                const Text(
                  'Selamat Datang di',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),

                const SizedBox(height: 8),

                // Judul utama
                const Text(
                  'PPDB TK NURUL HIDAYAH',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF189B4F),
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  'Pendaftaran Siswa Baru\nSecara Online',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                ),

                const SizedBox(height: 20),

                // Awan
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Awan kiri
                    Image.asset('assets/images/awan.png', width: 90),

                    // Awan kanan
                    Image.asset('assets/images/awan2.png', width: 90),
                  ],
                ),

                const Spacer(),

                // Area gambar bawah
                SizedBox(
                  height: 260,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      // Lahan hijau
                      Positioned(
                        bottom: 0,
                        child: Image.asset(
                          'assets/images/padang_hijau.png',
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                      ),

                      // Anak sekolah
                      Positioned(
                        bottom: 35,
                        child: Image.asset(
                          'assets/images/anak_disekolah.png',
                          width: 300,
                        ),
                      ),

                      // Pagar rumput depan anak
                      Positioned(
                        bottom: 0,
                        child: Image.asset(
                          'assets/images/pagar_rumput.png',
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                // Tombol Masuk
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1D944B),

                        elevation: 3,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),

                      child: const Text(
                        'MASUK',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                // Tombol lihat info
                SizedBox(
                  width: 180,
                  height: 48,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const HomePage(isGuest: true),
                        ),
                      );
                    },

                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: Color(0xFF1D944B),
                        width: 2,
                      ),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),

                    child: const Text(
                      'LIHAT INFO',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1D944B),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}