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
}
