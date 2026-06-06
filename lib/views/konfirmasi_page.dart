import 'package:flutter/material.dart';
import 'pendaftaran_berhasil_page.dart';
import '../viewmodels/pendaftaran_viewmodel.dart';

class KonfirmasiPage extends StatefulWidget {
  const KonfirmasiPage({super.key});

  @override
  State<KonfirmasiPage> createState() => _KonfirmasiPageState();
}

class _KonfirmasiPageState extends State<KonfirmasiPage> {
  final PendaftaranViewModel pendaftaranViewModel = PendaftaranViewModel();
  String namaAnak = '';
  String jenisKelamin = '';
  String ttlAnak = '';
  String nikAnak = '';
  String alamatAnak = '';
  String agamaAnak = '';

  String namaOrtu = '';
  String ttlOrtu = '';
  String alamatOrtu = '';
  String agamaOrtu = '';
  String pekerjaanOrtu = '';
  String noTlpOrtu = '';

  String kkFile = '';
  String aktaFile = '';
  String fotoFile = '';

  String kkOrtuFile = '';
  String ktpOrtuFile = '';

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
  final data = await pendaftaranViewModel.getDataKonfirmasi();

  if (!mounted) return;

  setState(() {
    namaAnak = data['nama_anak'] ?? '';
    jenisKelamin = data['jenis_kelamin'] ?? '';
    ttlAnak = data['ttl_anak'] ?? '';
    nikAnak = data['nik_anak'] ?? '';
    alamatAnak = data['alamat_anak'] ?? '';
    agamaAnak = data['agama_anak'] ?? '';

    namaOrtu = data['nama_ortu'] ?? '';
    ttlOrtu = data['ttl_ortu'] ?? '';
    alamatOrtu = data['alamat_ortu'] ?? '';
    agamaOrtu = data['agama_ortu'] ?? '';
    pekerjaanOrtu = data['pekerjaan_ortu'] ?? '';
    noTlpOrtu = data['no_tlp_ortu'] ?? '';

    kkFile = data['kk_file'] ?? '';
    aktaFile = data['akta_file'] ?? '';
    fotoFile = data['foto_file'] ?? '';

    kkOrtuFile = data['kk_ortu_file'] ?? '';
    ktpOrtuFile = data['ktp_ortu_file'] ?? '';
  });
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

              // TITLE
              const Text(
                'KONFIRMASI DATA',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1D944B),
                ),
              ),

              const SizedBox(height: 8),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  'Silahkan periksa kembali data pendaftaran Anda sebelum dikirim',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14),
                ),
              ),

              const SizedBox(height: 20),

              // DATA ANAK
              buildCard(
                title: 'Data Anak',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoText(title: 'Nama', value: namaAnak),

                    InfoText(title: 'Jenis Kelamin', value: jenisKelamin),

                    InfoText(title: 'TTL', value: ttlAnak),

                    InfoText(title: 'NIK', value: nikAnak),

                    InfoText(title: 'Alamat', value: alamatAnak),

                    InfoText(title: 'Agama', value: agamaAnak),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              // DATA ORTU
              buildCard(
                title: 'Data Orang Tua',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoText(title: 'Nama', value: namaOrtu),

                    InfoText(title: 'TTL', value: ttlOrtu),

                    InfoText(title: 'Alamat', value: alamatOrtu),

                    InfoText(title: 'Agama', value: agamaOrtu),

                    InfoText(title: 'Pekerjaan', value: pekerjaanOrtu),

                    InfoText(title: 'No. Tlp', value: noTlpOrtu),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              // BERKAS
              buildCard(
                title: 'Berkas',
                child: Column(
                  children: [
                    FileItem(fileName: kkFile),

                    FileItem(fileName: aktaFile),

                    FileItem(fileName: fotoFile),

                    FileItem(fileName: kkOrtuFile),

                    FileItem(fileName: ktpOrtuFile),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // BUTTON
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50,
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
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const PendaftaranBerhasilPage(),
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
                            'KIRIM',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

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

  static Widget buildCard({required String title, required Widget child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1D944B),
              ),
            ),

            const SizedBox(height: 10),

            child,
          ],
        ),
      ),
    );
  }
}

class InfoText extends StatelessWidget {
  final String title;
  final String value;

  const InfoText({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black87, fontSize: 13),
          children: [
            TextSpan(
              text: '$title : ',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }
}

class FileItem extends StatelessWidget {
  final String fileName;

  const FileItem({super.key, required this.fileName});

  String get displayName {
    if (fileName.isEmpty) return '-';
    return fileName.split('/').last.split('\\').last;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(displayName,
            style: const TextStyle(fontSize: 13))),
        ],
      ),
    );
  }
}
