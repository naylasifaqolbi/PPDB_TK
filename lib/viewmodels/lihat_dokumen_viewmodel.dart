import 'package:flutter/material.dart';
import '../core/database_helper.dart';

class LihatDokumenViewModel extends ChangeNotifier {
  List<Map<String, dynamic>> pendaftar = [];
  int? selectedIndex;

  bool isLoading = false;

  Future<void> loadDokumen() async {
    isLoading = true;
    notifyListeners();

    try {
      pendaftar = await DatabaseHelper.instance.getAllPendaftaran();
    } catch (e) {
      debugPrint('Error load dokumen: $e');
    }

    isLoading = false;
    notifyListeners();
  }

  void selectIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  Map<String, dynamic>? get selectedData {
    if (selectedIndex == null) return null;
    if (selectedIndex! >= pendaftar.length) return null;
    return pendaftar[selectedIndex!];
  }
}
