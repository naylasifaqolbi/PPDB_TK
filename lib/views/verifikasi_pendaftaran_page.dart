import 'package:flutter/material.dart';
import 'verifikasi_berhasil_page.dart';
import '../core/database_helper.dart';

class VerifikasiPendaftaranPage extends StatefulWidget {
  const VerifikasiPendaftaranPage({super.key});

  @override
  State<VerifikasiPendaftaranPage> createState() =>
      _VerifikasiPendaftaranPageState();
}

class _VerifikasiPendaftaranPageState extends State<VerifikasiPendaftaranPage> {
  List<Map<String, dynamic>> dataPendaftar = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final data = await DatabaseHelper.instance.getAllPendaftaran();

    setState(() {
      dataPendaftar = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            // ======================
            // HEADER
            // ======================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                children: [
                  Image.asset('assets/images/logo.png', width: 38),

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
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(color: Colors.black12, blurRadius: 5),
                      ],
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

            const SizedBox(height: 8),

            // ======================
            // JUDUL
            // ======================
            const Text(
              'DATA PENDAFTAR PPDB',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1D944B),
              ),
            ),

            const SizedBox(height: 20),

            // ======================
            // TABEL
            // ======================
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),

                child: Column(
                  children: [
                    Table(
                      border: TableBorder.all(color: Colors.black26),

                      columnWidths: const {
                        0: FlexColumnWidth(1),
                        1: FlexColumnWidth(3),
                        2: FlexColumnWidth(2.5),
                      },

                      children: [
                        // HEADER TABLE
                        const TableRow(
                          decoration: BoxDecoration(color: Color(0xFFEAF8EF)),

                          children: [
                            Padding(
                              padding: EdgeInsets.all(12),
                              child: Text(
                                'NO',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.all(12),
                              child: Text(
                                'NAMA ANAK',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.all(12),
                              child: Text(
                                'VERIFIKASI',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),

                        // DATA TABLE
                        ...List.generate(dataPendaftar.length, (index) {
                          final status =
                              dataPendaftar[index]['status']?.toString() ??
                              'Menunggu Verifikasi';

                          return TableRow(
                            children: [
                              // NO
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  '${index + 1}',
                                  textAlign: TextAlign.center,
                                ),
                              ),

                              // NAMA
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  dataPendaftar[index]['nama_anak']
                                          ?.toString() ??
                                      '',
                                ),
                              ),

                              // VERIFIKASI
                              Padding(
                                padding: const EdgeInsets.all(8),

                                child: status == 'Menunggu Verifikasi'
                                    // BELUM DIKLIK
                                    ? Column(
                                        children: [
                                          SizedBox(
                                            width: double.infinity,

                                            child: ElevatedButton(
                                              onPressed: () async {
                                                await DatabaseHelper.instance
                                                    .updateStatus(
                                                      dataPendaftar[index]['no_pendaftaran']
                                                          .toString(),
                                                      'Diterima',
                                                    );

                                                loadData();
                                              },

                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.green,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      vertical: 10,
                                                    ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),

                                              child: const Text(
                                                'Terima',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),

                                          const SizedBox(height: 6),

                                          SizedBox(
                                            width: double.infinity,

                                            child: ElevatedButton(
                                              onPressed: () async {
                                                await DatabaseHelper.instance
                                                    .updateStatus(
                                                      dataPendaftar[index]['no_pendaftaran']
                                                          .toString(),
                                                      'Ditolak',
                                                    );

                                                loadData();
                                              },

                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.red,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      vertical: 10,
                                                    ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),

                                              child: const Text(
                                                'Tolak',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    // SUDAH DIKLIK
                                    : Center(
                                        child: Column(
                                          children: [
                                            Icon(
                                              status == 'Diterima'
                                                  ? Icons.check_circle
                                                  : Icons.cancel,
                                              color: status == 'Diterima'
                                                  ? Colors.green
                                                  : Colors.red,
                                              size: 35,
                                            ),

                                            const SizedBox(height: 4),

                                            Text(
                                              status == 'Diterima'
                                                  ? 'Diterima'
                                                  : 'Ditolak',
                                              style: TextStyle(
                                                color: status == 'Diterima'
                                                    ? Colors.green
                                                    : Colors.red,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                              ),
                            ],
                          );
                        }),
                      ],
                    ),

                    const SizedBox(height: 30),

                    // ======================
                    // TOMBOL SIMPAN
                    // ======================
                    SizedBox(
                      width: double.infinity,
                      height: 55,

                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const VerifikasiBerhasilPage(),
                            ),
                          );
                        },

                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1D944B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),

                        child: const Text(
                          'SIMPAN UPDATE',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 35),
                  ],
                ),
              ),
            ),

            // ======================
            // FOOTER ASSET
            // ======================
            SizedBox(
              height: 65,
              width: double.infinity,

              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,

                    child: Image.asset(
                      'assets/images/padang_hijau.png',
                      fit: BoxFit.fill,
                    ),
                  ),

                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: Image.asset('assets/images/rumput2.png', width: 95),
                  ),

                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Image.asset('assets/images/rumput.png', width: 95),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
