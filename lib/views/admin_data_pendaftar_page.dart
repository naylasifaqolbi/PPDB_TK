// lib/views/admin_data_pendaftar_page.dart
import 'package:flutter/material.dart';
import '../models/pendaftar_model.dart';

class AdminDataPendaftarPage extends StatelessWidget {
  const AdminDataPendaftarPage({super.key});

  final List<Pendaftar> pendaftarList = const [
    Pendaftar(no: 1, nama: 'Azalia Sasmita', noPendaftaran: 'PPDB-2026-001'),
    Pendaftar(no: 2, nama: 'Alfin Ramadhani', noPendaftaran: 'PPDB-2026-002'),
    Pendaftar(no: 3, nama: 'Felicia Putri', noPendaftaran: 'PPDB-2026-003'),
    Pendaftar(no: 4, nama: 'Nur Fatimah Azzahra', noPendaftaran: 'PPDB-2026-004'),
    Pendaftar(no: 5, nama: 'Rio Fernando', noPendaftaran: 'PPDB-2026-005'),
    Pendaftar(no: 6, nama: 'Widya Sari', noPendaftaran: 'PPDB-2026-006'),
    Pendaftar(no: 7, nama: 'Yeni Faradilla', noPendaftaran: 'PPDB-2026-007'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF8EF),
      body: Stack(
        children: [
          // Footer padang hijau
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/padang_hijau.png',
              fit: BoxFit.fill,
              height: 120,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 12),
                // Header logo + judul
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Image.asset('assets/images/logo.png', width: 40, height: 40),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: Text(
                          'DATA PENDAFTAR PPDB',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1D944B),
                          ),
                        ),
                      ),
                      const Icon(Icons.notifications, color: Color(0xFF1D944B)),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                // Card tabel
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                      child: Column(
                        children: [
                          // Header tabel
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: const Color(0xFFBEEBCF),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                            ),
                            child: Row(
                              children: const [
                                Expanded(
                                    flex: 1,
                                    child: Center(
                                        child: Text('NO',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)))),
                                Expanded(
                                    flex: 3,
                                    child: Center(
                                        child: Text('NAMA ANAK',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)))),
                                Expanded(
                                    flex: 2,
                                    child: Center(
                                        child: Text('NOMOR PENDAFTARAN',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)))),
                              ],
                            ),
                          ),
                          // List pendaftar
                          Expanded(
                            child: ListView.separated(
                              padding: const EdgeInsets.all(0),
                              itemCount: pendaftarList.length,
                              separatorBuilder: (context, index) => Divider(
                                  height: 1, color: Colors.grey.shade300),
                              itemBuilder: (context, index) {
                                final item = pendaftarList[index];
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 8),
                                  color: index % 2 == 0
                                      ? Colors.green[50]
                                      : Colors.white,
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child:
                                              Center(child: Text('${item.no}'))),
                                      Expanded(
                                          flex: 3,
                                          child: Center(child: Text(item.nama))),
                                      Expanded(
                                          flex: 2,
                                          child: Center(
                                              child: Text(item.noPendaftaran))),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                // Tombol kembali (lebih kecil)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: SizedBox(
                    width: double.infinity,
                    height: 42,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1D944B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'KEMBALI',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}