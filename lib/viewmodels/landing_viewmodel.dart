import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingViewModel extends ChangeNotifier {
  bool isGuest = false;
  bool isLoading = true;

  LandingViewModel() {
    _checkGuestStatus();
  }

  Future<void> _checkGuestStatus() async {
    final prefs = await SharedPreferences.getInstance();
    isGuest = prefs.getBool('is_guest') ?? false;
    isLoading = false;
    notifyListeners();
  }

  void goToLogin(BuildContext context) {
    Navigator.pushNamed(context, '/login');
  }

  void goToHomeAsGuest(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_guest', true);

    Navigator.pushNamed(
      context,
      '/home',
      arguments: {'isGuest': true},
    );
  }
}