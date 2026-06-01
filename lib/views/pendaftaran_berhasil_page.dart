import 'package:flutter/material.dart';

class PendaftaranBerhasilPage extends StatelessWidget {
  const PendaftaranBerhasilPage({super.key});

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
                const SizedBox(height: 10),

                // HEADER
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Image.asset('assets/images/logo.png', width: 40),

                      const SizedBox(width: 10),

                      const Expanded(
                        child: Text(
                          'TK Nurul Hidayah',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
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

                const SizedBox(height: 20),

                // AWAN
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/images/awan.png', width: 60),

                    Image.asset('assets/images/awan2.png', width: 60),
                  ],
                ),

                const SizedBox(height: 15),

                // ILUSTRASI
                SizedBox(
                  height: 230,
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
                        right: 20,
                        bottom: 28,
                        child: Image.asset(
                          'assets/images/sekolah.png',
                          width: 145,
                        ),
                      ),

                      // anak
                      Positioned(
                        left: 20,
                        bottom: 25,
                        child: Image.asset(
                          'assets/images/anak.png',
                          width: 135,
                        ),
                      ),

                      // pagar
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

                const Spacer(),

                // FOOTER
                SizedBox(
                  height: 85,
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
                          width: 80,
                        ),
                      ),

                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Image.asset(
                          'assets/images/rumput2.png',
                          width: 80,
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
                margin: const EdgeInsets.symmetric(horizontal: 30),

                padding: const EdgeInsets.all(24),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                ),

                child: Stack(
                  children: [
                    Positioned(
                      right: -8,
                      top: -8,
                      child: IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: Colors.black54,
                        ),
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/home',
                            (route) => false,
                          );
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 70,
                          ),

                          const SizedBox(height: 18),

                          const Text(
                            'Pendaftaran\nBerhasil',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1D944B),
                            ),
                          ),

                          const SizedBox(height: 12),

                          const Text(
                            'Data pendaftaran Anda telah berhasil dikirim',
                            textAlign: TextAlign.center,
                          ),

                          const SizedBox(height: 20),

                          const Text(
                            'Nomor Pendaftaran',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),

                          const SizedBox(height: 8),

                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),

                            decoration: BoxDecoration(
                              color: const Color(0xFFEAF7EF),
                              borderRadius: BorderRadius.circular(16),
                            ),

                            child: const Text(
                              'PPDB-2026-001',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1D944B),
                              ),
                            ),
                          ),

                          const SizedBox(height: 18),

                          const Text(
                            'Harap simpan nomor pendaftaran ini untuk cek status',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 13),
                          ),

                          const SizedBox(height: 24),

                          SizedBox(
                            width: double.infinity,
                            height: 52,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, '/status');
                              },

                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1D944B),

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),

                              child: const Text(
                                'Lihat Status',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
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