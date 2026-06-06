import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/detail_dokumen_viewmodel.dart';

class DetailDokumenPage extends StatelessWidget {
  final Map<String, dynamic> dataAnak;

  const DetailDokumenPage({super.key, required this.dataAnak});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DetailDokumenViewModel(dataAnak),

      child: Consumer<DetailDokumenViewModel>(
        builder: (context, vm, child) {
          return Scaffold(
            backgroundColor: const Color(0xFFEFFAFF),

            body: SafeArea(
              child: Stack(
                children: [
                  Container(color: Colors.black.withOpacity(0.45)),

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
                            'Detail Dokumen',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 16),

                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(14),

                            decoration: BoxDecoration(
                              color: const Color(0xFFF7F7F7),
                              borderRadius: BorderRadius.circular(12),
                            ),

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Text(
                                  'Nama Anak : ${vm.namaAnak}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),

                                const SizedBox(height: 18),

                                ...vm.dokumenList.map(
                                  (dokumen) => _dokumenItem(
                                    context,
                                    dokumen['nama'] ?? '',
                                    dokumen['path'] ?? '',
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 18),

                          SizedBox(
                            width: double.infinity,
                            height: 44,

                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[300],
                                foregroundColor: Colors.black,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(22),
                                ),
                              ),

                              onPressed: () => Navigator.pop(context),

                              child: const Text(
                                'KEMBALI',
                                style: TextStyle(fontWeight: FontWeight.w600),
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
        },
      ),
    );
  }

  Widget _dokumenItem(BuildContext context, String namaDokumen, String pathFile) {
  final bool uploaded = pathFile.isNotEmpty;
  final String namaFile = uploaded
      ? pathFile.split('/').last.split('\\').last
      : 'Belum Upload';

  return Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Row(
      children: [
        Icon(
          uploaded ? Icons.check_circle : Icons.cancel,
          color: uploaded ? Colors.green : Colors.red,
        ),

        const SizedBox(width: 10),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                namaDokumen,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 3),

              Text(
                namaFile,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),

        if (uploaded)
          TextButton(
            onPressed: () {
              _showDokumenPreview(context, pathFile);
            },
            child: const Text('Buka'),
          )
        else
          const Text(
            'Belum Upload',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
      ],
    ),
  );
}

void _showDokumenPreview(BuildContext context, String pathFile) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ),

              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(
                  File(pathFile),
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'File tidak dapat ditampilkan. Pastikan file berupa gambar dan masih tersedia.',
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
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