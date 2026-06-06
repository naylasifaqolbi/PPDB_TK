import 'package:flutter/material.dart';
import '../core/database_helper.dart';

class VerifikasiPendaftaranViewModel extends ChangeNotifier {
  List<Map<String, dynamic>> _dataPendaftar = [];

  List<Map<String, dynamic>> get dataPendaftar => _dataPendaftar;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> loadData() async {
    _isLoading = true;
    notifyListeners();

    try {
      final data = await DatabaseHelper.instance.getAllPendaftaran();

      _dataPendaftar = data;
    } catch (e) {
      debugPrint('Error load verifikasi pendaftaran: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> updateStatus(String noPendaftaran, String status) async {
    try {
      await DatabaseHelper.instance.updateStatus(noPendaftaran, status);

      await loadData();
    } catch (e) {
      debugPrint('Error update status verifikasi: $e');
    }
  }
}
