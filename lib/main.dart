import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'views/splash_screen.dart';
import 'views/home_page.dart';
import 'views/login_page.dart';
import 'views/status_page.dart';
import 'views/register_page.dart';
import 'views/form_pendaftaran_page.dart';
import 'views/jadwal_page.dart';
import 'views/lokasi_page.dart';
import 'views/kontak_page.dart';

import 'viewmodels/login_viewmodel.dart';
import 'viewmodels/register_viewmodel.dart';
import 'viewmodels/status_viewmodel.dart';
import 'viewmodels/splash_viewmodel.dart';
import 'viewmodels/landing_viewmodel.dart';
import 'viewmodels/home_viewmodel.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => RegisterViewModel()),
        ChangeNotifierProvider(create: (_) => StatusViewModel()),
        ChangeNotifierProvider(create: (_) => SplashViewModel()),
        ChangeNotifierProvider(create: (_) => LandingViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PPDB TK Nurul Hidayah',

      home: const SplashScreen(),

      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) {
          // Ambil argumen isGuest dari route
          final args =
              ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>? ?? {};
          final isGuest = args['isGuest'] ?? false;
          return HomePage(isGuest: isGuest);
        },
        '/status': (context) => const StatusPage(),
        '/register': (context) => const RegisterPage(),
        '/form_pendaftaran': (context) => const FormPendaftaranPage(),
        '/jadwal': (context) => const JadwalPage(),
        '/lokasi': (context) => const LokasiPage(),
        '/kontak': (context) => const KontakPage(),
      },
    );
  }
}