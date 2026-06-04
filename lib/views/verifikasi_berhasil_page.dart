import 'package:flutter/material.dart';
import 'admin_home_page.dart';

class VerifikasiBerhasilPage extends StatelessWidget {
  const VerifikasiBerhasilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFFAFF),

      body: SafeArea(
        child: Stack(
          children: [
            // ======================
            // BACKGROUND
            // ======================
            Column(
              children: [
                const SizedBox(height: 8),

                // HEADER
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),

                  child: Row(
                    children: [
                      Image.asset('assets/images/logo.png', width: 38),

                      const SizedBox(width: 8),

                      const Expanded(
                        child: Text(
                          'TK Nurul Hidayah',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.all(7),

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),

                        child: const Icon(
                          Icons.notifications,
                          size: 18,
                          color: Color(0xFF1D944B),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                // AWAN
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/images/awan.png', width: 52),

                    Image.asset('assets/images/awan2.png', width: 52),
                  ],
                ),

                // ILUSTRASI
                SizedBox(
                  height: 170,

                  child: Stack(
                    alignment: Alignment.bottomCenter,

                    children: [
                      Positioned(
                        bottom: 0,

                        child: Image.asset(
                          'assets/images/padang_hijau.png',
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                      ),

                      Positioned(
                        right: 20,
                        bottom: 22,

                        child: Image.asset(
                          'assets/images/sekolah.png',
                          width: 125,
                        ),
                      ),

                      Positioned(
                        left: 20,
                        bottom: 18,

                        child: Image.asset(
                          'assets/images/anak.png',
                          width: 160,
                        ),
                      ),

                      Positioned(
                        bottom: 0,

                        child: Image.asset(
                          'assets/images/pagar_rumput.png',
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                // FOOTER
                SizedBox(
                  height: 80,

                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          'assets/images/padang_hijau.png',
                          fit: BoxFit.fill,
                        ),
                      ),

                      Positioned(
                        left: 0,
                        bottom: 0,

                        child: Image.asset(
                          'assets/images/rumput.png',
                          width: 75,
                        ),
                      ),

                      Positioned(
                        right: 0,
                        bottom: 0,

                        child: Image.asset(
                          'assets/images/rumput2.png',
                          width: 75,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // ======================
            // OVERLAY GELAP
            // ======================
            Container(color: Colors.black.withOpacity(0.45)),

            // ======================
            // POPUP BERHASIL
            // ======================
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 28),

                padding: const EdgeInsets.all(24),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),

                child: Column(
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    const Icon(
                      Icons.check_circle,
                      size: 90,
                      color: Colors.green,
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      'Verifikasi Berhasil!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      'Data verifikasi pendaftaran berhasil diperbarui.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, color: Colors.black87),
                    ),

                    const SizedBox(height: 22),

                    SizedBox(
                      width: double.infinity,
                      height: 46,

                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1D944B),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),

                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AdminHomePage(),
                            ),
                            (route) => false,
                          );
                        },

                        child: const Text(
                          'KEMBALI',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
