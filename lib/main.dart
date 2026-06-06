import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'views/splash_screen.dart';
import 'views/home_page.dart';
import 'views/login_page.dart';
import 'views/status_page.dart';

import 'viewmodels/login_viewmodel.dart';
import 'viewmodels/register_viewmodel.dart';
import 'viewmodels/status_viewmodel.dart';
import 'viewmodels/splash_viewmodel.dart';

import 'viewmodels/admin_login_viewmodel.dart';
import 'viewmodels/admin_home_viewmodel.dart';
import 'viewmodels/admin_data_pendaftar_viewmodel.dart';
import 'viewmodels/verifikasi_pendaftaran_viewmodel.dart';
import 'viewmodels/verifikasi_berhasil_viewmodel.dart';
import 'viewmodels/lihat_dokumen_viewmodel.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => RegisterViewModel()),
        ChangeNotifierProvider(create: (_) => StatusViewModel()),
        ChangeNotifierProvider(create: (_) => SplashViewModel()),

        // ADMIN
        ChangeNotifierProvider(create: (_) => AdminLoginViewModel()),
        ChangeNotifierProvider(create: (_) => AdminHomeViewModel()),
        ChangeNotifierProvider(create: (_) => AdminDataPendaftarViewModel()),
        ChangeNotifierProvider(create: (_) => VerifikasiPendaftaranViewModel()),
        ChangeNotifierProvider(create: (_) => VerifikasiBerhasilViewModel()),
        ChangeNotifierProvider(create: (_) => LihatDokumenViewModel()),
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
        '/home': (context) => const HomePage(),
        '/status': (context) => const StatusPage(),
      },
    );
  }
}
