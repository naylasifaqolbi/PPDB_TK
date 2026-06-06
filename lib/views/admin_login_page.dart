import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/admin_login_viewmodel.dart';

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({super.key});

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<AdminLoginViewModel>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFEFFAFF),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),

              // Logo
              Image.asset('assets/images/logo.png', width: 70),

              const SizedBox(height: 20),

              // Title
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'PPDB TK NURUL HIDAYAH NURUL',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1D944B),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                'Selamat Datang Admin!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 30),

              // Card Login
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  padding: const EdgeInsets.all(22),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 8),
                    ],
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          'Masuk Akun',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1D944B),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // EMAIL
                      const Text(
                        'Email',
                        style: TextStyle(fontWeight: FontWeight.w600),
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
                          prefixIcon: const Icon(Icons.email),
                        ),
                      ),

                      const SizedBox(height: 18),

                      // PASSWORD
                      const Text(
                        'Kata Sandi',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),

                      const SizedBox(height: 8),

                      TextField(
                        controller: passwordController,
                        obscureText: vm.isPasswordHidden,

                        decoration: InputDecoration(
                          hintText: 'Kata Sandi Anda',
                          filled: true,
                          fillColor: const Color(0xFFF5F5F5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),

                          prefixIcon: const Icon(Icons.lock),

                          suffixIcon: IconButton(
                            onPressed: () {
                              vm.togglePasswordVisibility();
                            },
                            icon: Icon(
                              vm.isPasswordHidden
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // REMEMBER ME
                      Row(
                        children: [
                          Checkbox(
                            value: vm.isRememberMe,
                            activeColor: const Color(0xFF1D944B),
                            onChanged: (value) {
                              vm.toggleRememberMe(value ?? false);
                            },
                          ),

                          const Text('Ingat Saya'),
                        ],
                      ),

                      const SizedBox(height: 12),

                      // BUTTON LOGIN
                      SizedBox(
                        width: double.infinity,
                        height: 52,

                        child: ElevatedButton(
                          onPressed: vm.isLoading
                              ? null
                              : () {
                                  vm.loginAdmin(
                                    context,
                                    emailController.text.trim(),
                                    passwordController.text.trim(),
                                  );
                                },

                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1D944B),

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),

                          child: vm.isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  'Masuk',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // FOOTER
              SizedBox(
                height: 100,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        'assets/images/padang_hijau.png',
                        fit: BoxFit.fill,
                      ),
                    ),

                    Positioned(
                      left: 0,
                      bottom: 0,
                      child: Image.asset('assets/images/rumput.png', width: 90),
                    ),

                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Image.asset(
                        'assets/images/rumput2.png',
                        width: 90,
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
