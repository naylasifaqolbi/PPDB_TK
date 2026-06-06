import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/register_viewmodel.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();

    final phoneController = TextEditingController();

    final passwordController = TextEditingController();

    final confirmPasswordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),

              const Text(
                'PPDB TK NURUL HIDAYAH',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1D944B),
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                height: 220,
                child: Stack(
                  alignment: Alignment.bottomCenter,

                  children: [
                    Positioned(
                      bottom: 0,
                      child: Image.asset(
                        'assets/images/padang_hijau.png',
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    ),

                    Positioned(
                      bottom: 10,
                      child: Image.asset(
                        'assets/images/anak_bahagia.png',
                        width: 280,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 28),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    const Text(
                      'Registrasi Akun',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 28),

                    const Text('Email'),

                    TextField(controller: emailController),

                    const SizedBox(height: 22),

                    const Text('Nomor Telepon'),

                    TextField(controller: phoneController),

                    const SizedBox(height: 22),

                    const Text('Kata Sandi'),

                    TextField(
                      controller: passwordController,
                      obscureText: true,
                    ),

                    const SizedBox(height: 22),

                    const Text('Konfirmasi Kata Sandi'),

                    TextField(
                      controller: confirmPasswordController,
                      obscureText: true,
                    ),

                    const SizedBox(height: 30),

                    SizedBox(
                      width: double.infinity,
                      height: 56,

                      child: ElevatedButton(
                        onPressed: () {
                          context.read<RegisterViewModel>().register(
                            context,
                            emailController.text,
                            phoneController.text,
                            passwordController.text,
                            confirmPasswordController.text,
                          );
                        },

                        child: const Text('Daftar Akun'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
