import 'package:flutter/material.dart';
import 'konfirmasi_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/database_helper.dart';

class FormOrangTuaPage extends StatefulWidget {
  final String namaAnak;
  const FormOrangTuaPage({super.key, required this.namaAnak});

  @override
  State<FormOrangTuaPage> createState() => _FormOrangTuaPageState();
}

class _FormOrangTuaPageState extends State<FormOrangTuaPage> {
  String? selectedReligion;

  final TextEditingController namaOrtuController = TextEditingController();

  final TextEditingController ttlOrtuController = TextEditingController();

  final TextEditingController alamatOrtuController = TextEditingController();

  final TextEditingController pekerjaanController = TextEditingController();

  final TextEditingController noTlpController = TextEditingController();

  final List<String> religions = [
    'Islam',
    'Kristen',
    'Katolik',
    'Hindu',
    'Buddha',
    'Konghucu',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFFAFF),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),

              // HEADER
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Image.asset('assets/images/logo.png', width: 40),

                    const SizedBox(width: 10),

                    const Expanded(
                      child: Text(
                        'TK Nurul Hidayah',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.notifications,
                        size: 18,
                        color: Color(0xFF1D944B),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // TITLE
              const Text(
                'FORMULIR',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1D944B),
                ),
              ),

              const Text(
                'PENDAFTARAN',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1D944B),
                ),
              ),

              const SizedBox(height: 25),

              // CARD DATA ORANG TUA
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 8),
                    ],
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'DATA ORANG TUA/WALI',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1D944B),
                        ),
                      ),

                      const SizedBox(height: 20),

                      buildField(
                        'Nama Lengkap Orang Tua',
                        controller: namaOrtuController,
                      ),

                      buildField(
                        'Tempat & Tanggal Lahir',
                        controller: ttlOrtuController,
                      ),

                      buildField(
                        'Alamat Lengkap',
                        controller: alamatOrtuController,
                        maxLines: 3,
                      ),

                      const Text(
                        'Agama',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),

                      const SizedBox(height: 8),

                      DropdownButtonFormField<String>(
                        initialValue: selectedReligion,

                        decoration: inputDecoration(),

                        hint: const Text('Pilih Agama'),

                        items: religions.map((religion) {
                          return DropdownMenuItem(
                            value: religion,
                            child: Text(religion),
                          );
                        }).toList(),

                        onChanged: (value) {
                          setState(() {
                            selectedReligion = value;
                          });
                        },
                      ),

                      const SizedBox(height: 16),

                      buildField('Nomor Telepon', controller: noTlpController),

                      buildField('Pekerjaan', controller: pekerjaanController),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // CARD DOKUMEN
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 8),
                    ],
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'UNGGAH DOKUMEN',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1D944B),
                        ),
                      ),

                      const SizedBox(height: 18),

                      buildUploadBox('Scan Kartu Keluarga (KK)'),

                      const SizedBox(height: 16),

                      buildUploadBox('Scan KTP Orang Tua'),

                      const SizedBox(height: 16),

                      Row(
                        children: [
                          const Icon(Icons.check_circle, color: Colors.green),

                          const SizedBox(width: 8),

                          Expanded(
                            child: Text(
                              'Data di atas sudah benar',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // BUTTON
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (namaOrtuController.text.trim().isEmpty ||
                              ttlOrtuController.text.trim().isEmpty ||
                              alamatOrtuController.text.trim().isEmpty ||
                              pekerjaanController.text.trim().isEmpty ||
                              noTlpController.text.trim().isEmpty ||
                              selectedReligion == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Mohon lengkapi seluruh data orang tua',
                                ),
                              ),
                            );
                            return;
                          }

                          // kode lama tetap
                          final prefs = await SharedPreferences.getInstance();

                          await prefs.setBool('sudah_mendaftar', true);

                          await prefs.setString(
                            'status',
                            'Menunggu Verifikasi',
                          );
                          await prefs.setString(
                            'nama_ortu',
                            namaOrtuController.text,
                          );

                          await prefs.setString(
                            'ttl_ortu',
                            ttlOrtuController.text,
                          );

                          await prefs.setString(
                            'alamat_ortu',
                            alamatOrtuController.text,
                          );

                          await prefs.setString(
                            'agama_ortu',
                            selectedReligion ?? '',
                          );

                          await prefs.setString(
                            'pekerjaan_ortu',
                            pekerjaanController.text,
                          );

                          await prefs.setString(
                            'no_tlp_ortu',
                            noTlpController.text,
                          );

                          if (!mounted) return;

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const KonfirmasiPage(),
                            ),
                          );
                        },

                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1D944B),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),

                        child: const Text(
                          'SELANJUTNYA',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },

                        child: const Text('KEMBALI'),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // FOOTER
              SizedBox(
                height: 85,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        'assets/images/padang_hijau.png',
                        fit: BoxFit.fill,
                      ),
                    ),

                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Image.asset('assets/images/rumput.png', width: 80),
                    ),

                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Image.asset(
                        'assets/images/rumput2.png',
                        width: 80,
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

  Widget buildField(
    String label, {
    TextEditingController? controller,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),

          const SizedBox(height: 8),

          TextField(
            controller: controller,
            maxLines: maxLines,
            decoration: inputDecoration(),
          ),
        ],
      ),
    );
  }

  Widget buildUploadBox(String title) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Expanded(child: Text(title)),

          ElevatedButton(
            onPressed: () {},

            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1D944B),
            ),

            child: const Text(
              'Unggah File',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration inputDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: const Color(0xFFF6F6F6),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
    );
  }
}
