import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/database_helper.dart';
import '../models/pendaftaran_model.dart';

class PendaftaranViewModel extends ChangeNotifier {
  Future<String> buatNomorPendaftaran() async {
    final prefs = await SharedPreferences.getInstance();

    int nomorUrut = prefs.getInt('nomor_urut') ?? 0;
    nomorUrut++;

    await prefs.setInt('nomor_urut', nomorUrut);

    return 'PPDB-2026-${nomorUrut.toString().padLeft(3, '0')}';
  }

  Future<int> simpanDataAnak(PendaftaranModel pendaftaran) async {
    return await DatabaseHelper.instance.insertPendaftaran(
      pendaftaran.toMap(),
    );
  }

  Future<void> simpanDataSementaraAnak({
    required String nomorPendaftaran,
    required String namaAnak,
    required String namaPanggilan,
    required String jenisKelamin,
    required String ttlAnak,
    required String nikAnak,
    required String alamatAnak,
    required String agamaAnak,
    required String kkFile,
    required String aktaFile,
    required String fotoFile,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('no_pendaftaran', nomorPendaftaran);
    await prefs.setString('nama_anak', namaAnak);
    await prefs.setString('nama_panggilan', namaPanggilan);
    await prefs.setString('jenis_kelamin', jenisKelamin);
    await prefs.setString('ttl_anak', ttlAnak);
    await prefs.setString('nik_anak', nikAnak);
    await prefs.setString('alamat_anak', alamatAnak);
    await prefs.setString('agama_anak', agamaAnak);
    await prefs.setString('kk_file', kkFile);
    await prefs.setString('akta_file', aktaFile);
    await prefs.setString('foto_file', fotoFile);
  }

  Future<void> simpanDataOrangTua({
    required String namaOrtu,
    required String ttlOrtu,
    required String alamatOrtu,
    required String agamaOrtu,
    required String pekerjaanOrtu,
    required String noTlpOrtu,
    required String kkOrtuFile,
    required String ktpOrtuFile,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool('sudah_mendaftar', true);
    await prefs.setString('status', 'Menunggu Verifikasi');
    await prefs.setString('nama_ortu', namaOrtu);
    await prefs.setString('ttl_ortu', ttlOrtu);
    await prefs.setString('alamat_ortu', alamatOrtu);
    await prefs.setString('agama_ortu', agamaOrtu);
    await prefs.setString('pekerjaan_ortu', pekerjaanOrtu);
    await prefs.setString('no_tlp_ortu', noTlpOrtu);
    await prefs.setString('kk_ortu_file', kkOrtuFile);
    await prefs.setString('ktp_ortu_file', ktpOrtuFile);
  }

  Future<Map<String, String>> getDataKonfirmasi() async {
    final prefs = await SharedPreferences.getInstance();

    return {
      'nama_anak': prefs.getString('nama_anak') ?? '',
      'jenis_kelamin': prefs.getString('jenis_kelamin') ?? '',
      'ttl_anak': prefs.getString('ttl_anak') ?? '',
      'nik_anak': prefs.getString('nik_anak') ?? '',
      'alamat_anak': prefs.getString('alamat_anak') ?? '',
      'agama_anak': prefs.getString('agama_anak') ?? '',

      'nama_ortu': prefs.getString('nama_ortu') ?? '',
      'ttl_ortu': prefs.getString('ttl_ortu') ?? '',
      'alamat_ortu': prefs.getString('alamat_ortu') ?? '',
      'agama_ortu': prefs.getString('agama_ortu') ?? '',
      'pekerjaan_ortu': prefs.getString('pekerjaan_ortu') ?? '',
      'no_tlp_ortu': prefs.getString('no_tlp_ortu') ?? '',

      'kk_file': prefs.getString('kk_file') ?? '',
      'akta_file': prefs.getString('akta_file') ?? '',
      'foto_file': prefs.getString('foto_file') ?? '',

      'kk_ortu_file': prefs.getString('kk_ortu_file') ?? '',
      'ktp_ortu_file': prefs.getString('ktp_ortu_file') ?? '',
    };
  }
  Future<List<PendaftaranModel>> getAllPendaftaran() async {
    final data = await DatabaseHelper.instance.getAllPendaftaran();

    return data.map((item) {
      return PendaftaranModel.fromMap(item);
    }).toList();
  }
}