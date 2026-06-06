import 'package:flutter/material.dart';
import '../core/database_helper.dart';

class HomeViewModel extends ChangeNotifier {
  bool isGuest;
  bool isLoading = true;
  List<Map<String, dynamic>> pendaftarList = [];

  HomeViewModel({this.isGuest = false}) {
    loadPendaftar();
  }

  Future<void> loadPendaftar() async {
    isLoading = true;
    notifyListeners();

    if (!isGuest) {
      pendaftarList = await DatabaseHelper.instance.getAllPendaftaran();
    }

    isLoading = false;
    notifyListeners();
  }

  void goToFormPendaftaran(BuildContext context) {
    if (isGuest) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text('Silakan registrasi terlebih dahulu untuk mendaftar.'),
        ),
      );
    } else {
      Navigator.pushNamed(context, '/form_pendaftaran');
    }
  }

  void goToRegister(BuildContext context) {
    Navigator.pushNamed(context, '/register');
  }

  void goToJadwal(BuildContext context) {
    Navigator.pushNamed(context, '/jadwal');
  }

  void goToLokasi(BuildContext context) {
    Navigator.pushNamed(context, '/lokasi');
  }

  void goToStatus(BuildContext context) {
    Navigator.pushNamed(context, '/status');
  }

  void goToKontak(BuildContext context) {
    Navigator.pushNamed(context, '/kontak');
  }
}