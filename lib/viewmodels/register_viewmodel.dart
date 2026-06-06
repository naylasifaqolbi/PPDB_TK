import 'package:flutter/material.dart';

import '../core/database_helper.dart';
import '../models/user_model.dart';

class RegisterViewModel extends ChangeNotifier {
  Future<void> register(
    BuildContext context,
    String email,
    String phone,
    String password,
    String confirmPassword,
  ) async {
    if (email.isEmpty ||
        phone.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Semua form wajib diisi')));

      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Password tidak sama')));

      return;
    }

    final emailSudahAda = await DatabaseHelper.instance.emailExists(email);

    if (emailSudahAda) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Email sudah terdaftar')));

      return;
    }

    final user = UserModel(email: email, phone: phone, password: password);

    await DatabaseHelper.instance.registerUser(user.toMap());

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Registrasi berhasil')));

    Navigator.pushReplacementNamed(context, '/login');
  }
}
