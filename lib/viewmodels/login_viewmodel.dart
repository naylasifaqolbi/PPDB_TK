import 'package:flutter/material.dart';

import '../core/database_helper.dart';

class LoginViewModel extends ChangeNotifier {
  bool isRememberMe = false;

  void toggleRememberMe(bool value) {
    isRememberMe = value;
    notifyListeners();
  }

  Future<void> login(
    BuildContext context,
    String email,
    String password,
  ) async {
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Semua form wajib diisi')));

      return;
    }

    final user = await DatabaseHelper.instance.loginUser(email, password);

    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email atau password salah')),
      );

      return;
    }

    Navigator.pushReplacementNamed(context, '/home');
  }
}
