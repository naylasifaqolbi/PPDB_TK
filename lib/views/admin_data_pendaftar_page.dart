import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/admin_data_pendaftar_viewmodel.dart';

class AdminDataPendaftarPage extends StatefulWidget {
  const AdminDataPendaftarPage({super.key});

  @override
  State<AdminDataPendaftarPage> createState() => _AdminDataPendaftarPageState();
}

class _AdminDataPendaftarPageState extends State<AdminDataPendaftarPage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<AdminDataPendaftarViewModel>().loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AdminDataPendaftarViewModel>();

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
                      Image.asset(
                        'assets/images/logo.png',
                        width: 40,
                        height: 40,
                      ),

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

                            decoration: const BoxDecoration(
                              color: Color(0xFFBEEBCF),

                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                            ),

                            child: const Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Center(
                                    child: Text(
                                      'NO',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),

                                Expanded(
                                  flex: 3,
                                  child: Center(
                                    child: Text(
                                      'NAMA ANAK',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),

                                Expanded(
                                  flex: 2,
                                  child: Center(
                                    child: Text(
                                      'NO PENDAFTARAN',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Loading
                          if (viewModel.isLoading)
                            const Expanded(
                              child: Center(child: CircularProgressIndicator()),
                            )
                          // List pendaftar
                          else
                            Expanded(
                              child: ListView.separated(
                                padding: const EdgeInsets.all(0),

                                itemCount: viewModel.pendaftarList.length,

                                separatorBuilder: (context, index) => Divider(
                                  height: 1,
                                  color: Colors.grey.shade300,
                                ),

                                itemBuilder: (context, index) {
                                  final item = viewModel.pendaftarList[index];

                                  return Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 8,
                                    ),

                                    color: index % 2 == 0
                                        ? Colors.green[50]
                                        : Colors.white,

                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Center(
                                            child: Text('${index + 1}'),
                                          ),
                                        ),

                                        Expanded(
                                          flex: 3,
                                          child: Center(
                                            child: Text(
                                              item['nama_anak'] ?? '',
                                            ),
                                          ),
                                        ),

                                        Expanded(
                                          flex: 2,
                                          child: Center(
                                            child: Text(
                                              item['no_pendaftaran'] ?? '',
                                            ),
                                          ),
                                        ),
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

                // Tombol kembali
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),

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
