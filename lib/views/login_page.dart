import 'package:flutter/material.dart';
import 'register_page.dart';
import 'home_page.dart';
import 'admin_login_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),

              // Login Admin kanan atas
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

              // Judul
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

              // Area ilustrasi
              SizedBox(
                height: 180,
                child: Stack(
                  alignment: Alignment.bottomCenter,

                  children: [
                    // Padang hijau
                    Positioned(
                      bottom: 0,
                      child: Image.asset(
                        'assets/images/padang_hijau.png',
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    ),

                    // Anak bahagia
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
                    const SizedBox(height: 0),

                    // Judul form
                    const Text(
                      'Masuk Akun',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Email label
                    const Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Email field
                    TextField(
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

                    // Password label
                    const Text(
                      'Kata Sandi',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Password field
                    TextField(
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

                    const SizedBox(height: 8),

                    // Ingat Saya
                    Row(
                      children: [
                        Checkbox(
                          value: isRememberMe,

                          activeColor: const Color(0xFF1D944B),

                          onChanged: (value) {
                            setState(() {
                              isRememberMe = value!;
                            });
                          },
                        ),

                        const Text('Ingat Saya'),
                      ],
                    ),

                    const SizedBox(height: 8),

                    // Tombol Masuk
                    SizedBox(
                      width: double.infinity,
                      height: 56,

                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
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

                    // Atau
                    const Center(
                      child: Text('Atau', style: TextStyle(fontSize: 16)),
                    ),

                    const SizedBox(height: 4),

                    // Registrasi
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

                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                          ),

                          child: const Text(
                            'Daftar disini',
                            style: TextStyle(
                              color: Color(0xFF1D944B),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),
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
