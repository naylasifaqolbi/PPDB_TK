import 'package:flutter/material.dart';
import 'form_orangtua_page.dart';
import '../models/pendaftaran_model.dart';
import '../viewmodels/pendaftaran_viewmodel.dart';
import 'package:file_picker/file_picker.dart';

class FormPendaftaranPage extends StatefulWidget {
  const FormPendaftaranPage({super.key});

  @override
  State<FormPendaftaranPage> createState() => _FormPendaftaranPageState();
}

class _FormPendaftaranPageState extends State<FormPendaftaranPage> {
  String gender = 'Laki-laki';
  String? selectedReligion;

  String? kkFile;
  String? aktaFile;
  String? fotoFile;

  final PendaftaranViewModel pendaftaranViewModel = PendaftaranViewModel();

  final TextEditingController namaController = TextEditingController();
  final TextEditingController namaPanggilanController = TextEditingController();
  final TextEditingController ttlController = TextEditingController();
  final TextEditingController nikController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final List<String> religions = [
    'Islam',
    'Kristen',
    'Katolik',
    'Hindu',
    'Buddha',
    'Konghucu',
  ];

  Future<void> pilihFile(String jenis) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        if (jenis == 'kk') {
          kkFile = result.files.single.path;
        }

        if (jenis == 'akta') {
          aktaFile = result.files.single.path;
        }

        if (jenis == 'foto') {
          fotoFile = result.files.single.path;
        }
      });
    }
  }

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

              // JUDUL
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

              // CARD DATA SISWA
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
                        'DATA CALON SISWA',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1D944B),
                        ),
                      ),

                      const SizedBox(height: 20),

                      buildField('Nama Lengkap', controller: namaController),

                      buildField(
                        'Nama Panggilan',
                        controller: namaPanggilanController,
                      ),

                      const Text(
                        'Jenis Kelamin',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),

                      Row(
                        children: [
                          Radio(
                            value: 'Laki-laki',
                            groupValue: gender,
                            activeColor: const Color(0xFF1D944B),
                            onChanged: (value) {
                              setState(() {
                                gender = value!;
                              });
                            },
                          ),

                          const Text('Laki-laki'),

                          Radio(
                            value: 'Perempuan',
                            groupValue: gender,
                            activeColor: const Color(0xFF1D944B),
                            onChanged: (value) {
                              setState(() {
                                gender = value!;
                              });
                            },
                          ),

                          const Text('Perempuan'),
                        ],
                      ),

                      buildField(
                        'Tempat & Tanggal Lahir',
                        controller: ttlController,
                      ),

                      buildField('NIK Anak', controller: nikController),

                      buildField(
                        'Alamat',
                        controller: alamatController,
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

                      buildUploadBox('Scan Kartu Keluarga (KK)', 'kk', kkFile),

                      const SizedBox(height: 16),

                      buildUploadBox('Scan Akta Kelahiran', 'akta', aktaFile),

                      const SizedBox(height: 16),

                      buildUploadBox('Pas Foto Anak', 'foto', fotoFile),
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
                          if (namaController.text.trim().isEmpty ||
                              namaPanggilanController.text.trim().isEmpty ||
                              ttlController.text.trim().isEmpty ||
                              nikController.text.trim().isEmpty ||
                              alamatController.text.trim().isEmpty ||
                              selectedReligion == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Mohon lengkapi seluruh data siswa'),
                              ),
                            );
                            return;
                          }

                          if (nikController.text.trim().length != 16 ||
                              int.tryParse(nikController.text.trim()) == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('NIK harus 16 digit angka'),
                              ),
                            );
                            return;
                          }

                          if (kkFile == null ||
                              aktaFile == null ||
                              fotoFile == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Semua dokumen wajib diunggah'),
                              ),
                            );
                            return;
                          }

                          // kode tetap
                          final noPendaftaran = 
                            await pendaftaranViewModel.buatNomorPendaftaran();

                          final pendaftaran = PendaftaranModel(
                            namaAnak: namaController.text.trim(),
                            namaPanggilan: namaPanggilanController.text.trim(),
                            jenisKelamin: gender,
                            ttlAnak: ttlController.text.trim(),
                            nikAnak: nikController.text.trim(),
                            alamatAnak: alamatController.text.trim(),
                            agamaAnak: selectedReligion ?? '',

                            namaOrtu: '',
                            ttlOrtu: '',
                            alamatOrtu: '',
                            agamaOrtu: '',
                            pekerjaanOrtu: '',
                            noTlpOrtu: '',

                            kkFile: kkFile ?? '',
                            aktaFile: aktaFile ?? '',
                            fotoFile: fotoFile ?? '',
                            kkOrtuFile: '',
                            ktpOrtuFile: '',

                            nomorPendaftaran: noPendaftaran,
                            status: 'Menunggu Verifikasi',
                          );

                          final id = await pendaftaranViewModel.simpanDataAnak(pendaftaran);

                          await pendaftaranViewModel.simpanDataSementaraAnak(
                            nomorPendaftaran: noPendaftaran,
                            namaAnak: namaController.text.trim(),
                            namaPanggilan: namaPanggilanController.text.trim(),
                            jenisKelamin: gender,
                            ttlAnak: ttlController.text.trim(),
                            nikAnak: nikController.text.trim(),
                            alamatAnak: alamatController.text.trim(),
                            agamaAnak: selectedReligion ?? '',
                            kkFile: kkFile ?? '',
                            aktaFile: aktaFile ?? '',
                            fotoFile: fotoFile ?? '',
                          );

                          debugPrint('Data tersimpan dengan ID: $id');

                          if (!context.mounted) return;

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FormOrangTuaPage(
                                namaAnak: namaController.text.trim(),
                              ),
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

                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFF1D944B)),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),

                        child: const Text(
                          'KEMBALI',
                          style: TextStyle(
                            color: Color(0xFF1D944B),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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

  Widget buildUploadBox(String title, String jenis, String? namaFile) {
    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(18),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  pilihFile(jenis);
                },

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

          if (namaFile != null)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                '✓ $namaFile',
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
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
