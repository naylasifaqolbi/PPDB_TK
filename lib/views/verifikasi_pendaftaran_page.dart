import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/verifikasi_pendaftaran_viewmodel.dart';
import 'verifikasi_berhasil_page.dart';

class VerifikasiPendaftaranPage extends StatefulWidget {
  const VerifikasiPendaftaranPage({super.key});

  @override
  State<VerifikasiPendaftaranPage> createState() =>
      _VerifikasiPendaftaranPageState();
}

class _VerifikasiPendaftaranPageState extends State<VerifikasiPendaftaranPage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<VerifikasiPendaftaranViewModel>().loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<VerifikasiPendaftaranViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
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

            const Text(
              'DATA PENDAFTAR PPDB',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1D944B),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: viewModel.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
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
                              const TableRow(
                                decoration: BoxDecoration(
                                  color: Color(0xFFEAF8EF),
                                ),

                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(12),
                                    child: Text(
                                      'NO',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.all(12),
                                    child: Text(
                                      'NAMA ANAK',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.all(12),
                                    child: Text(
                                      'VERIFIKASI',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              ...List.generate(viewModel.dataPendaftar.length, (
                                index,
                              ) {
                                final item = viewModel.dataPendaftar[index];

                                final status =
                                    item['status']?.toString() ??
                                    'Menunggu Verifikasi';

                                return TableRow(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Text(
                                        '${index + 1}',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Text(
                                        item['nama_anak']?.toString() ?? '',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(8),

                                      child: status == 'Menunggu Verifikasi'
                                          ? Column(
                                              children: [
                                                SizedBox(
                                                  width: double.infinity,

                                                  child: ElevatedButton(
                                                    onPressed: () async {
                                                      await viewModel
                                                          .updateStatus(
                                                            item['no_pendaftaran']
                                                                .toString(),
                                                            'Diterima',
                                                          );
                                                    },

                                                    style: ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                          Colors.green,
                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                            vertical: 10,
                                                          ),
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              10,
                                                            ),
                                                      ),
                                                    ),

                                                    child: const Text(
                                                      'Terima',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),

                                                const SizedBox(height: 6),

                                                SizedBox(
                                                  width: double.infinity,

                                                  child: ElevatedButton(
                                                    onPressed: () async {
                                                      await viewModel
                                                          .updateStatus(
                                                            item['no_pendaftaran']
                                                                .toString(),
                                                            'Ditolak',
                                                          );
                                                    },

                                                    style: ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                          Colors.red,
                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                            vertical: 10,
                                                          ),
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              10,
                                                            ),
                                                      ),
                                                    ),

                                                    child: const Text(
                                                      'Tolak',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
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
                                                      color:
                                                          status == 'Diterima'
                                                          ? Colors.green
                                                          : Colors.red,
                                                      fontWeight:
                                                          FontWeight.bold,
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
