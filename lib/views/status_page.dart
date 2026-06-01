import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/status_viewmodel.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({super.key});

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  final TextEditingController noController = TextEditingController();
  String cekResult = '';

  @override
  void dispose() {
    noController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => StatusViewModel()..loadStatus(),
      child: Consumer<StatusViewModel>(
        builder: (context, vm, _) {
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

                  // OVERLAY GELAP
                  Container(color: Colors.black.withOpacity(0.45)),

                  // POPUP STATUS
                  Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 28),
                      padding: const EdgeInsets.all(22),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: StatefulBuilder(
                        builder: (context, setState) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'Status Pendaftaran',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 14),

                              TextField(
                                controller: noController,
                                decoration: InputDecoration(
                                  hintText: 'Masukkan Nomor Pendaftaran',
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 12,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 12),

                              SizedBox(
                                width: double.infinity,
                                height: 42,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF1D944B),
                                    foregroundColor: Colors.white,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(22),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (noController.text.trim().isEmpty) {
                                      setState(() {
                                        cekResult =
                                            'Silakan masukkan nomor pendaftaran terlebih dahulu.';
                                      });
                                      return;
                                    }

                                    vm.cekStatus(noController.text.trim());

                                    setState(() {
                                      cekResult = vm.isChecked
                                          ? vm.statusPendaftaran ?? ''
                                          : vm.message;
                                    });
                                  },
                                  child: const Text(
                                    'CEK STATUS',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 12),

                              if (cekResult.isNotEmpty)
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                      255,
                                      249,
                                      249,
                                      249,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    cekResult,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),

                              const SizedBox(height: 12),

                              SizedBox(
                                width: double.infinity,
                                height: 42,
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
                                    Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      '/home',
                                      (route) => false,
                                    );
                                  },
                                  child: const Text(
                                    'TUTUP',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
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