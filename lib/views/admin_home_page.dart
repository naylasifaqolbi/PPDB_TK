import 'package:flutter/material.dart';
import 'admin_data_pendaftar_page.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,

        title: const Text(
          'Dashboard Admin',
          style: TextStyle(
            color: Color(0xFF1D944B),
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.logout, color: Color(0xFF1D944B)),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 8),

            // ==========================
            // HEADER PALING ATAS
            // ==========================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),

              child: Row(
                children: [
                  Image.asset('assets/images/logo.png', width: 42),

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

                      boxShadow: const [
                        BoxShadow(color: Colors.black12, blurRadius: 5),
                      ],
                    ),

                    child: const Icon(
                      Icons.notifications,
                      size: 20,
                      color: Color(0xFF1D944B),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ==========================
            // SAPAAN ADMIN
            // ==========================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),

              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),

                decoration: BoxDecoration(
                  color: const Color(0xFFEAF8EF),

                  borderRadius: BorderRadius.circular(20),
                ),

                child: const Column(
                  children: [
                    Text(
                      'Selamat Datang Admin!',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1D944B),
                      ),
                    ),

                    SizedBox(height: 6),

                    Text(
                      'Kelola data pendaftaran siswa dengan mudah',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),

            // ==========================
            // AWAN (MEPET PINGGIR)
            // ==========================
            SizedBox(
              width: double.infinity,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Transform.translate(
                    offset: const Offset(-8, 0),
                    child: Image.asset('assets/images/awan.png', width: 90),
                  ),

                  Transform.translate(
                    offset: const Offset(8, 0),
                    child: Image.asset('assets/images/awan2.png', width: 90),
                  ),
                ],
              ),
            ),

            // ==========================
            // ILUSTRASI FULL WIDTH
            // ==========================
            SizedBox(
              height: 170,
              width: double.infinity,

              child: Stack(
                alignment: Alignment.bottomCenter,

                children: [
                  // PADANG HIJAU
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,

                    child: Image.asset(
                      'assets/images/padang_hijau.png',
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                    ),
                  ),

                  // SEKOLAH
                  Positioned(
                    right: 18,
                    bottom: 28,

                    child: Image.asset('assets/images/sekolah.png', width: 180),
                  ),

                  // ANAK
                  Positioned(
                    left: 18,
                    bottom: 18,

                    child: Image.asset('assets/images/anak.png', width: 180),
                  ),

                  // PAGAR RUMPUT
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,

                    child: Image.asset(
                      'assets/images/pagar_rumput.png',
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // ==========================
            // MENU NAVIGASI
            // ==========================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),

              child: Column(
                children: [
                  _menuButton(
                  context,
                  title: 'Lihat Data Pendaftar',
                  icon: Icons.people_alt_rounded,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AdminDataPendaftarPage(),
                      ),
                    );
                  },
                ),
                  const SizedBox(height: 16),

                  _menuButton(
                    context,
                    title: 'Verifikasi Pendaftaran',
                    icon: Icons.verified_user,
                    onTap: () {},
                  ),

                  const SizedBox(height: 16),

                  _menuButton(
                    context,
                    title: 'Lihat Dokumen',
                    icon: Icons.folder_copy_rounded,
                    onTap: () {},
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuButton(
    BuildContext context, {
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 75,

      child: ElevatedButton(
        onPressed: onTap,

        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1D944B),
          elevation: 4,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
        ),

        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 30),

            const SizedBox(width: 16),

            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18),
          ],
        ),
      ),
    );
  }
}
