import 'package:flutter/material.dart';

import '../views/admin_data_pendaftar_page.dart';
import '../views/verifikasi_pendaftaran_page.dart';
import '../views/lihat_dokumen_page.dart';

class AdminHomeViewModel extends ChangeNotifier {
  void logout(BuildContext context) {
    Navigator.pop(context);
  }

  void goToDataPendaftar(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AdminDataPendaftarPage()),
    );
  }

  void goToVerifikasi(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const VerifikasiPendaftaranPage(),
      ),
    );
  }

  void goToDokumen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LihatDokumenPage()),
    );
  }
}
