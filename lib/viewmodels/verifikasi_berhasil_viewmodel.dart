import 'package:flutter/material.dart';
import '../views/admin_home_page.dart';

class VerifikasiBerhasilViewModel extends ChangeNotifier {
  void kembaliKeDashboard(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const AdminHomePage()),
      (route) => false,
    );
  }
}
