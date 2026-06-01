import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StatusViewModel extends ChangeNotifier {
  String? noPendaftaran;
  String? namaAnak;
  String? statusPendaftaran;

  bool isRegistered = false;
  bool isLoading = true;
  bool isChecked = false;

  String message = '';

  Future<void> loadStatus() async {
    final prefs = await SharedPreferences.getInstance();

    noPendaftaran = prefs.getString('no_pendaftaran');
    namaAnak = prefs.getString('nama_anak');
    statusPendaftaran = prefs.getString('status') ?? 'Menunggu Verifikasi';

    final sudahMendaftar = prefs.getBool('sudah_mendaftar') ?? false;

    isRegistered = sudahMendaftar ||
        (noPendaftaran != null && noPendaftaran!.isNotEmpty);

    isLoading = false;
    notifyListeners();
  }

  void cekStatus(String inputNo) {
    final input = inputNo.trim();
    final nomorTersimpan = noPendaftaran?.trim();

    if (input.isEmpty) {
      isChecked = false;
      message = 'Nomor pendaftaran harus diisi';
    } else if (nomorTersimpan != null &&
        nomorTersimpan.isNotEmpty &&
        input == nomorTersimpan) {
      isChecked = true;
      message = '';
    } else {
      isChecked = false;
      message = 'Nomor pendaftaran tidak ditemukan';
    }

    notifyListeners();
  }
}