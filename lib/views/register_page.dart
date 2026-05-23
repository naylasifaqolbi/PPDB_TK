import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),

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

              const SizedBox(height: 15),

              // Area ilustrasi
              SizedBox(
                height: 220,
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
                    const SizedBox(height: 10),

                    // Judul form
                    const Text(
                      'Registrasi Akun',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 28),

                    // EMAIL
                    const Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 8),

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

                    const SizedBox(height: 22),

                    // NOMOR TELEPON
                    const Text(
                      'Nomor Telepon',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        // Dropdown kode negara
                        Container(
                          width: 90,
                          height: 58,
                          padding: const EdgeInsets.symmetric(horizontal: 12),

                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F5F5),

                            borderRadius: BorderRadius.circular(16),
                          ),

                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: '+62',

                              items: const [
                                DropdownMenuItem(
                                  value: '+62',
                                  child: Text('+62'),
                                ),
                              ],

                              onChanged: (value) {},
                            ),
                          ),
                        ),

                        const SizedBox(width: 10),

                        // Nomor telepon
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.phone,

                            decoration: InputDecoration(
                              hintText: '000 0000 0000',

                              filled: true,
                              fillColor: const Color(0xFFF5F5F5),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 22),

                    // PASSWORD
                    const Text(
                      'Kata Sandi',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 8),

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

                    const SizedBox(height: 22),

                    // KONFIRMASI PASSWORD
                    const Text(
                      'Konfirmasi Kata Sandi',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 8),

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

                    const SizedBox(height: 30),

                    // Tombol daftar
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {},

                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1D944B),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),

                        child: const Text(
                          'Daftar Akun',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),
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
