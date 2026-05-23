import 'package:flutter/material.dart';

class JadwalPage extends StatelessWidget {
  const JadwalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFFAFF),

      body: SafeArea(
        child: Stack(
          children: [
            // BACKGROUND
            Column(
              children: [
                const SizedBox(height: 8),

                // HEADER
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Image.asset('assets/images/logo.png', width: 38),

                      const SizedBox(width: 10),

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

                const SizedBox(height: 12),

                // AWAN
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/images/awan.png', width: 55),

                    Image.asset('assets/images/awan2.png', width: 55),
                  ],
                ),

                const SizedBox(height: 8),

                // ILUSTRASI
                SizedBox(
                  height: 180,
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

                      // sekolah
                      Positioned(
                        right: 18,
                        bottom: 22,
                        child: Image.asset(
                          'assets/images/sekolah.png',
                          width: 120,
                        ),
                      ),

                      // anak
                      Positioned(
                        left: 20,
                        bottom: 18,
                        child: Image.asset(
                          'assets/images/anak.png',
                          width: 100,
                        ),
                      ),

                      // pagar
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
                  height: 75,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          'assets/images/padang_hijau.png',
                          fit: BoxFit.fill,
                        ),
                      ),

                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Image.asset(
                          'assets/images/rumput.png',
                          width: 70,
                        ),
                      ),

                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Image.asset(
                          'assets/images/rumput2.png',
                          width: 70,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // OVERLAY GELAP
            Container(color: Colors.black.withOpacity(0.45)),

            // POPUP
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 28),

                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),

                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Jadwal Pendaftaran',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1D944B),
                      ),
                    ),

                    const SizedBox(height: 16),

                    buildScheduleCard('Pembukaan Pendaftaran', '1 Mei 2026'),

                    const SizedBox(height: 10),

                    buildScheduleCard('Penutupan Pendaftaran', '30 Juni 2026'),

                    const SizedBox(height: 10),

                    buildScheduleCard('Verifikasi Berkas', '1 - 3 Hari Kerja'),

                    const SizedBox(height: 10),

                    buildScheduleCard('Pengumuman Hasil', '5 Juli 2026'),

                    const SizedBox(height: 18),

                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },

                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1D944B),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),

                        child: const Text(
                          'TUTUP',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
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

  Widget buildScheduleCard(String title, String value) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),

      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(16),
      ),

      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 5),

          Text(
            value,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1D944B),
            ),
          ),
        ],
      ),
    );
  }
}
