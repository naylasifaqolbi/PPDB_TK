import 'package:flutter/material.dart';
import 'pendaftaran_berhasil_page.dart';

class KonfirmasiPage extends StatelessWidget {
  const KonfirmasiPage({super.key});

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
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoText(
                      title: 'Nama',
                      value: 'Aulia Sasmita Prameswari (Mita)',
                    ),

                    InfoText(title: 'Jenis Kelamin', value: 'Perempuan'),

                    InfoText(title: 'TTL', value: 'Malang, 20 Oktober 2017'),

                    InfoText(title: 'NIK', value: '1234567887654321'),

                    InfoText(
                      title: 'Alamat',
                      value: 'Jl. Mangga RT.11/RW.01 Gresik',
                    ),

                    InfoText(title: 'Agama', value: 'Islam'),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              // DATA ORTU
              buildCard(
                title: 'Data Orang Tua',
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoText(title: 'Nama', value: 'Hendry Pratama'),

                    InfoText(title: 'TTL', value: 'Surabaya, 13 Februari 1996'),

                    InfoText(
                      title: 'Alamat',
                      value: 'Jl. Raya Manyar No.27, Gresik',
                    ),

                    InfoText(title: 'Agama', value: 'Islam'),

                    InfoText(title: 'Pekerjaan', value: 'Wiraswasta'),

                    InfoText(title: 'No. Tlp', value: '0812 3456 7890'),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              // BERKAS
              buildCard(
                title: 'Berkas',
                child: const Column(
                  children: [
                    FileItem(fileName: 'kartukeluarga.pdf'),

                    FileItem(fileName: 'akta_anak.pdf'),

                    FileItem(fileName: 'ktp_ortu.pdf'),

                    FileItem(fileName: 'pasfoto_3x4.jpg'),
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 18),

          const SizedBox(width: 8),

          Expanded(child: Text(fileName, style: const TextStyle(fontSize: 13))),
        ],
      ),
    );
  }
}
