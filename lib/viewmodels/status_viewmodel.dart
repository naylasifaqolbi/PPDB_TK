import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/database_helper.dart';

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

    isRegistered =
        sudahMendaftar || (noPendaftaran != null && noPendaftaran!.isNotEmpty);

    isLoading = false;
    notifyListeners();
  }

  Future<void> cekStatus(String inputNo) async {
    final input = inputNo.trim();

    if (input.isEmpty) {
      isChecked = false;
      message = 'Nomor pendaftaran harus diisi';
      notifyListeners();
      return;
    }

    final result = await DatabaseHelper.instance.getPendaftaranByNo(input);

    if (result.isNotEmpty) {
      isChecked = true;
      statusPendaftaran = result.first['status'];
      namaAnak = result.first['nama_anak'];
      message = '';
    } else {
      isChecked = false;
      message = 'Nomor pendaftaran tidak ditemukan';
    }

    notifyListeners();
  }
}
