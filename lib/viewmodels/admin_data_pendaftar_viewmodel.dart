import 'package:flutter/material.dart';
import '../core/database_helper.dart';

class AdminDataPendaftarViewModel extends ChangeNotifier {
  List<Map<String, dynamic>> _pendaftarList = [];

  List<Map<String, dynamic>> get pendaftarList => _pendaftarList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> loadData() async {
    _isLoading = true;
    notifyListeners();

    try {
      final data = await DatabaseHelper.instance.getAllPendaftaran();

      _pendaftarList = data;
    } catch (e) {
      debugPrint('Error load data pendaftar: $e');
    }

    _isLoading = false;
    notifyListeners();
  }
}
