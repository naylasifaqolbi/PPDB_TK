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
      nomorPendaftaran: map['no_pendaftaran'] ?? '',
      status: map['status'] ?? '',
    );
  }
}