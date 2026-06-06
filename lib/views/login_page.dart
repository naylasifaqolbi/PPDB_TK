import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/login_viewmodel.dart';

import 'register_page.dart';
import 'admin_login_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();

    final passwordController = TextEditingController();

    return Consumer<LoginViewModel>(
      builder: (context, vm, child) {
        return Scaffold(
          backgroundColor: Colors.white,

          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,

                      children: [
                        TextButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AdminLoginPage(),
                              ),
                            );
                          },

                          icon: const Icon(
                            Icons.admin_panel_settings,
                            size: 18,
                            color: Color(0xFF1D944B),
                          ),

                          label: const Text(
                            'Admin',
                            style: TextStyle(
                              color: Color(0xFF1D944B),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 2),

                  const Text(
                    'PPDB TK NURUL HIDAYAH',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1D944B),
                    ),
                  ),

                  const SizedBox(height: 10),

                  SizedBox(
                    height: 180,
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
                            width: 230,
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
                          'Masuk Akun',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 24),

                        const Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(height: 8),

                        TextField(
                          controller: emailController,

                          decoration: InputDecoration(
                            hintText: 'emailanda@mail.com',

                            filled: true,
                            fillColor: const Color(0xFFF5F5F5),

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        const Text(
                          'Kata Sandi',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(height: 8),

                        TextField(
                          controller: passwordController,
                          obscureText: true,

                          decoration: InputDecoration(
                            hintText: 'Kata Sandi Anda',

                            filled: true,
                            fillColor: const Color(0xFFF5F5F5),

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),

                        Row(
                          children: [
                            Checkbox(
                              value: vm.isRememberMe,

                              activeColor: const Color(0xFF1D944B),

                              onChanged: (value) {
                                vm.toggleRememberMe(value!);
                              },
                            ),

                            const Text('Ingat Saya'),
                          ],
                        ),

                        SizedBox(
                          width: double.infinity,
                          height: 56,

                          child: ElevatedButton(
                            onPressed: () {
                              vm.login(
                                context,
                                emailController.text,
                                passwordController.text,
                              );
                            },

                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF1D944B),

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),

                            child: const Text(
                              'Masuk',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 6),

                        const Center(child: Text('Atau')),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            const Text('Belum punya akun?'),

                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const RegisterPage(),
                                  ),
                                );
                              },

                              child: const Text('Daftar disini'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
