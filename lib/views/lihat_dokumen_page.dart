import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/lihat_dokumen_viewmodel.dart';
import 'detail_dokumen_page.dart';

class LihatDokumenPage extends StatefulWidget {
  const LihatDokumenPage({super.key});

  @override
  State<LihatDokumenPage> createState() => _LihatDokumenPageState();
}

class _LihatDokumenPageState extends State<LihatDokumenPage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      if (!mounted) return;
      context.read<LihatDokumenViewModel>().loadDokumen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LihatDokumenViewModel>(
      builder: (context, vm, child) {
        return Scaffold(
          backgroundColor: Colors.white,

          body: SafeArea(
            child: Column(
              children: [
                // ==========================
                // HEADER (SAMA DENGAN VERIFIKASI)
                // ==========================
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),

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

                // ==========================
                // TITLE
                // ==========================
                const Text(
                  'DOKUMEN PPDB',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1D944B),
                  ),
                ),

                const SizedBox(height: 20),

                // ==========================
                // TABLE DATA
                // ==========================
                Expanded(
                  child: vm.isLoading
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
                                          'DOKUMEN',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  ...List.generate(vm.pendaftar.length, (
                                    index,
                                  ) {
                                    final item = vm.pendaftar[index];

                                    final status =
                                        item['status'] ?? 'Belum Upload';

                                    Color statusColor;

                                    if (status == 'Sudah Upload') {
                                      statusColor = Colors.green;
                                    } else if (status == 'Belum Lengkap') {
                                      statusColor = Colors.orange;
                                    } else {
                                      statusColor = Colors.red;
                                    }

                                    return TableRow(
                                      decoration: BoxDecoration(
                                        color: vm.selectedIndex == index
                                            ? Colors.green.shade100
                                            : Colors.white,
                                      ),

                                      children: [
                                        GestureDetector(
                                          onTap: () => vm.selectIndex(index),

                                          child: Padding(
                                            padding: const EdgeInsets.all(12),

                                            child: Text(
                                              '${index + 1}',
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),

                                        GestureDetector(
                                          onTap: () => vm.selectIndex(index),

                                          child: Padding(
                                            padding: const EdgeInsets.all(12),

                                            child: Text(
                                              item['nama_anak'] ?? '',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),

                                        GestureDetector(
                                          onTap: () => vm.selectIndex(index),

                                          child: Padding(
                                            padding: const EdgeInsets.all(12),

                                            child: Text(
                                              status,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: statusColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                                ],
                              ),

                              const SizedBox(height: 30),

                              // ==========================
                              // BUTTON
                              // ==========================
                              Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 55,

                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },

                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.grey,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              18,
                                            ),
                                          ),
                                        ),

                                        child: const Text(
                                          'KEMBALI',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  const SizedBox(width: 10),

                                  Expanded(
                                    child: SizedBox(
                                      height: 55,

                                      child: ElevatedButton(
                                        onPressed: () {
                                          if (vm.selectedIndex == null) {
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                  'Pilih data terlebih dahulu',
                                                ),
                                              ),
                                            );
                                            return;
                                          }

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailDokumenPage(
                                                    dataAnak: vm.selectedData!,
                                                  ),
                                            ),
                                          );
                                        },

                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color(
                                            0xFF1D944B,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              18,
                                            ),
                                          ),
                                        ),

                                        child: const Text(
                                          'CEK DOKUMEN',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 35),
                            ],
                          ),
                        ),
                ),

                // ==========================
                // FOOTER (SAMA DENGAN VERIFIKASI)
                // ==========================
                SizedBox(
                  height: 110,
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

                        child: Image.asset(
                          'assets/images/rumput2.png',
                          width: 95,
                        ),
                      ),

                      Positioned(
                        right: 0,
                        bottom: 0,

                        child: Image.asset(
                          'assets/images/rumput.png',
                          width: 95,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
