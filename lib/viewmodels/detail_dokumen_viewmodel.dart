import 'package:flutter/material.dart';

class DetailDokumenViewModel extends ChangeNotifier {
  final Map<String, dynamic> dataAnak;

  DetailDokumenViewModel(this.dataAnak);

  String get namaAnak => dataAnak['nama'] ?? '-';

  List<Map<String, dynamic>> get dokumenList => [
    {'nama': 'Akta Kelahiran', 'uploaded': true},
    {'nama': 'Kartu Keluarga', 'uploaded': true},
    {'nama': 'Foto Anak', 'uploaded': false},
    {'nama': 'KTP Orang Tua', 'uploaded': true},
  ];
}
