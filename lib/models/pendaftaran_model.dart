class PendaftaranModel {
  final int? id;

  final String namaAnak;
  final String namaPanggilan;
  final String jenisKelamin;
  final String ttlAnak;
  final String nikAnak;
  final String alamatAnak;
  final String agamaAnak;

  final String namaOrtu;
  final String ttlOrtu;
  final String alamatOrtu;
  final String agamaOrtu;
  final String pekerjaanOrtu;
  final String noTlpOrtu;

  final String kkFile;
  final String aktaFile;
  final String fotoFile;
  final String kkOrtuFile;
  final String ktpOrtuFile;

  final String nomorPendaftaran;
  final String status;

  PendaftaranModel({
    this.id,
    required this.namaAnak,
    required this.namaPanggilan,
    required this.jenisKelamin,
    required this.ttlAnak,
    required this.nikAnak,
    required this.alamatAnak,
    required this.agamaAnak,
    required this.namaOrtu,
    required this.ttlOrtu,
    required this.alamatOrtu,
    required this.agamaOrtu,
    required this.pekerjaanOrtu,
    required this.noTlpOrtu,
    required this.kkFile,
    required this.aktaFile,
    required this.fotoFile,
    required this.kkOrtuFile,
    required this.ktpOrtuFile,
    required this.nomorPendaftaran,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama_anak': namaAnak,
      'nama_panggilan': namaPanggilan,
      'jenis_kelamin': jenisKelamin,
      'ttl_anak': ttlAnak,
      'nik_anak': nikAnak,
      'alamat_anak': alamatAnak,
      'agama_anak': agamaAnak,
      'nama_ortu': namaOrtu,
      'ttl_ortu': ttlOrtu,
      'alamat_ortu': alamatOrtu,
      'agama_ortu': agamaOrtu,
      'pekerjaan_ortu': pekerjaanOrtu,
      'no_tlp_ortu': noTlpOrtu,
      'kk_file': kkFile,
      'akta_file': aktaFile,
      'foto_file': fotoFile,
      'kk_ortu_file': kkOrtuFile,
      'ktp_ortu_file': ktpOrtuFile,
      'no_pendaftaran': nomorPendaftaran,
      'status': status,
    };
  }

  factory PendaftaranModel.fromMap(Map<String, dynamic> map) {
    return PendaftaranModel(
      id: map['id'],
      namaAnak: map['nama_anak'] ?? '',
      namaPanggilan: map['nama_panggilan'] ?? '',
      jenisKelamin: map['jenis_kelamin'] ?? '',
      ttlAnak: map['ttl_anak'] ?? '',
      nikAnak: map['nik_anak'] ?? '',
      alamatAnak: map['alamat_anak'] ?? '',
      agamaAnak: map['agama_anak'] ?? '',
      namaOrtu: map['nama_ortu'] ?? '',
      ttlOrtu: map['ttl_ortu'] ?? '',
      alamatOrtu: map['alamat_ortu'] ?? '',
      agamaOrtu: map['agama_ortu'] ?? '',
      pekerjaanOrtu: map['pekerjaan_ortu'] ?? '',
      noTlpOrtu: map['no_tlp_ortu'] ?? '',
      kkFile: map['kk_file'] ?? '',
      aktaFile: map['akta_file'] ?? '',
      fotoFile: map['foto_file'] ?? '',
      kkOrtuFile: map['kk_ortu_file'] ?? '',
      ktpOrtuFile: map['ktp_ortu_file'] ?? '',
      nomorPendaftaran: map['no_pendaftaran'] ?? '',
      status: map['status'] ?? '',
    );
  }
}