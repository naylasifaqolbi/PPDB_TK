import 'package:flutter/material.dart';
import '../viewmodels/lokasi_viewmodel.dart';

class LokasiPage extends StatelessWidget {
  const LokasiPage({super.key});

  
  @override
  Widget build(BuildContext context) {
    final LokasiViewModel lokasiViewModel = LokasiViewModel();
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

                      Positioned(
                        right: 18,
                        bottom: 22,
                        child: Image.asset(
                          'assets/images/sekolah.png',
                          width: 120,
                        ),
                      ),

                      Positioned(
                        left: 20,
                        bottom: 18,
                        child: Image.asset(
                          'assets/images/anak.png',
                          width: 100,
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

            
            // OVERLAY 
            Container(color: Colors.black.withOpacity(0.45)),

            // POPUP LOKASI
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
                      'Lokasi Sekolah',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1D944B),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // ALAMAT
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.red),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            lokasiViewModel.alamatSekolah,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // MAPS BUTTON
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () async {
                          final berhasil = await lokasiViewModel.bukaGoogleMaps();

                          if (!context.mounted) return;

                          if (!berhasil) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Tidak dapat membuka Google Maps'),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1D944B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'LIHAT DI MAPS',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 18),

                    // TOMBOL TUTUP
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
}
