import 'package:flutter/material.dart';
import '../core/database_helper.dart';
import '../views/admin_home_page.dart';

class AdminLoginViewModel extends ChangeNotifier {
  bool isLoading = false;
  bool isRememberMe = false;
  bool isPasswordHidden = true;

  void toggleRememberMe(bool value) {
    isRememberMe = value;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    notifyListeners();
  }

  Future<void> loginAdmin(
    BuildContext context,
    String email,
    String password,
  ) async {
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email dan password wajib diisi')),
      );
      return;
    }

    isLoading = true;
    notifyListeners();

    final admin = await DatabaseHelper.instance.loginAdmin(email, password);

    isLoading = false;
    notifyListeners();

    if (!context.mounted) return;

    if (admin != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const AdminHomePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email atau password admin salah')),
      );
    }
  }
}
