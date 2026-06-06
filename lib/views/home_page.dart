import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/home_viewmodel.dart';
import 'register_page.dart';
import 'form_pendaftaran_page.dart';
import 'jadwal_page.dart';
import 'lokasi_page.dart';
import 'kontak_page.dart';

class HomePage extends StatelessWidget {
  final bool isGuest;
  const HomePage({super.key, this.isGuest = false});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(isGuest: isGuest),
      child: Consumer<HomeViewModel>(
        builder: (context, homeVM, child) {
          return Scaffold(
            backgroundColor: const Color(0xFFEFFAFF),
            body: SafeArea(
              child: Column(
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
                    height: 150,
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
                          bottom: 20,
                          child: Image.asset('assets/images/sekolah.png', width: 160),
                        ),
                        Positioned(
                          left: 20,
                          bottom: 15,
                          child: Image.asset('assets/images/anak.png', width: 165),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Image.asset('assets/images/pagar_rumput.png',
                              width: MediaQuery.of(context).size.width),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  // TITLE
                  const Text(
                    'PPDB TK NURUL HIDAYAH',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1D944B),
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    'Tahun Ajaran 2026/2027',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 10),
                  // BUTTON DAFTAR
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: SizedBox(
                      width: double.infinity,
                      height: 46,
                      child: ElevatedButton(
                        onPressed: () => homeVM.goToFormPendaftaran(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1D944B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          'DAFTAR SEKARANG',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // MENU
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26),
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 2.8,
                      children: [
                        HomeMenu(
                          icon: Icons.calendar_month,
                          title: 'Jadwal',
                          onTap: () => homeVM.goToJadwal(context),
                        ),
                        HomeMenu(
                          icon: Icons.location_on,
                          title: 'Lokasi',
                          onTap: () => homeVM.goToLokasi(context),
                        ),
                        HomeMenu(
                          icon: Icons.check_circle,
                          title: 'Status',
                          onTap: () => homeVM.goToStatus(context),
                        ),
                        HomeMenu(
                          icon: Icons.phone,
                          title: 'Kontak',
                          onTap: () => homeVM.goToKontak(context),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  // PENGUMUMAN
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(blurRadius: 6, color: Colors.black12),
                        ],
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pengumuman',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1D944B),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '• Pendaftaran dibuka 1 Mei - 30 Juni 2026',
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '• Siapkan berkas terlebih dahulu',
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '• Verifikasi maksimal 3 hari kerja',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  // FOOTER
                  SizedBox(
                    height: 100,
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/padang_hijau.png',
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          left: 0,
                          bottom: 0,
                          child: Image.asset('assets/images/rumput.png', width: 100),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Image.asset('assets/images/rumput2.png', width: 100),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class HomeMenu extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const HomeMenu({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [BoxShadow(blurRadius: 5, color: Colors.black12)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: const Color(0xFF1D944B), size: 22),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}