import 'package:flutter/material.dart';

class KontakPage extends StatelessWidget {
  const KontakPage({super.key});

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

                      // sekolah
                      Positioned(
                        right: 20,
                        bottom: 22,
                        child: Image.asset(
                          'assets/images/sekolah.png',
                          width: 125,
                        ),
                      ),

                      // anak
                      Positioned(
                        left: 20,
                        bottom: 18,
                        child: Image.asset(
                          'assets/images/anak.png',
                          width: 110,
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

            // OVERLAY GELAP
            Container(color: Colors.black.withOpacity(0.45)),

            // POPUP
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
                      'Kontak',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1D944B),
                      ),
                    ),

                    const SizedBox(height: 18),

                    // EMAIL CARD
                    buildContactCard(
                      icon: Icons.email,
                      title: 'Email',
                      value: 'hubungiemail@gmail.com',
                    ),

                    const SizedBox(height: 12),

                    // WHATSAPP CARD
                    buildContactCard(
                      icon: Icons.phone,
                      title: 'WhatsApp',
                      value: '0812-XXXX-XXXX',
                    ),

                    const SizedBox(height: 22),

                    // BUTTON TUTUP
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

  Widget buildContactCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: const Color(0xFFEAF8EE),
        borderRadius: BorderRadius.circular(18),
      ),

      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: const Color(0xFF1D944B),

            child: Icon(icon, color: Colors.white, size: 24),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color(0xFF1D944B),
                  ),
                ),

                const SizedBox(height: 4),

                Text(value, style: const TextStyle(fontSize: 13)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
