import 'package:flutter/material.dart';

class DetailDokumenPage extends StatelessWidget {
  final Map<String, dynamic> dataAnak;

  const DetailDokumenPage({super.key, required this.dataAnak});

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
            // POPUP DETAIL
            // ======================
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 28),

                padding: const EdgeInsets.all(22),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),

                child: Column(
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    const Text(
                      'Detail Dokumen',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 16),

                    Container(
                      width: double.infinity,

                      padding: const EdgeInsets.all(14),

                      decoration: BoxDecoration(
                        color: const Color(0xFFF7F7F7),
                        borderRadius: BorderRadius.circular(12),
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            'Nama Anak : ${dataAnak['nama']}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(height: 18),

                          _dokumenItem('Akta Kelahiran', true),

                          _dokumenItem('Kartu Keluarga', true),

                          _dokumenItem('Foto Anak', false),

                          _dokumenItem('KTP Orang Tua', true),
                        ],
                      ),
                    ),

                    const SizedBox(height: 18),

                    SizedBox(
                      width: double.infinity,
                      height: 44,

                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                          foregroundColor: Colors.black,
                          elevation: 0,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22),
                          ),
                        ),

                        onPressed: () {
                          Navigator.pop(context);
                        },

                        child: const Text(
                          'KEMBALI',
                          style: TextStyle(fontWeight: FontWeight.w600),
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

  Widget _dokumenItem(String namaDokumen, bool uploaded) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),

      child: Row(
        children: [
          Icon(
            uploaded ? Icons.check_circle : Icons.cancel,
            color: uploaded ? Colors.green : Colors.red,
          ),

          const SizedBox(width: 10),

          Expanded(child: Text(namaDokumen)),

          Text(
            uploaded ? 'Sudah Upload' : 'Belum Upload',

            style: TextStyle(
              color: uploaded ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
