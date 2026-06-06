import 'package:flutter/material.dart';

class DetailDokumenViewModel extends ChangeNotifier {
  final Map<String, dynamic> dataAnak;

  DetailDokumenViewModel(this.dataAnak);

  String get namaAnak => dataAnak['nama_anak']?.toString() ?? '-';

  List<Map<String, dynamic>> get dokumenList {
    return [
      {
        'nama': 'Kartu Keluarga Anak',
        'path': dataAnak['kk_file']?.toString() ?? '',
      },
      {
        'nama': 'Akta Kelahiran',
        'path': dataAnak['akta_file']?.toString() ?? '',
      },
      {
        'nama': 'Pas Foto Anak',
        'path': dataAnak['foto_file']?.toString() ?? '',
      },
      {
        'nama': 'Kartu Keluarga Orang Tua',
        'path': dataAnak['kk_ortu_file']?.toString() ?? '',
      },
      {
        'nama': 'KTP Orang Tua',
        'path': dataAnak['ktp_ortu_file']?.toString() ?? '',
      },
    ];
  }
}