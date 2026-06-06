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
                const SizedBox(height: 10),

                const Text(
                  'DOKUMEN PPDB',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1D944B),
                  ),
                ),

                const SizedBox(height: 20),

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
                                        child: Text('NO'),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(12),
                                        child: Text('NAMA ANAK'),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(12),
                                        child: Text('DOKUMEN'),
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
                                            child: Text('${index + 1}'),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () => vm.selectIndex(index),
                                          child: Padding(
                                            padding: const EdgeInsets.all(12),
                                            child: Text(
                                              item['nama_anak'] ?? '',
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () => vm.selectIndex(index),
                                          child: Padding(
                                            padding: const EdgeInsets.all(12),
                                            child: Text(
                                              status,
                                              style: TextStyle(
                                                color: statusColor,
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

                              Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('KEMBALI'),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
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
                                      child: const Text('CEK DOKUMEN'),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
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
