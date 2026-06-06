import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('ppdb.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 4,
      onCreate: _createDB,
      onUpgrade: _onUpgrade,
    );
  }

  // CREATE DATABASE
  Future<void> _createDB(Database db, int version) async {

    // TABEL USERS
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        email TEXT UNIQUE,
        phone TEXT,
        password TEXT
      )
    ''');

    // TABEL ADMIN
    await db.execute('''
      CREATE TABLE admin (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        email TEXT UNIQUE,
        password TEXT
      )
    ''');

    // ADMIN DEFAULT
    await db.insert('admin', {
      'email': 'admin@gmail.com',
      'password': 'admin123',
    });

    // TABLE PENDAFTARAN
    await db.execute('''
    CREATE TABLE pendaftaran (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      no_pendaftaran TEXT,
      nama_anak TEXT,
      nama_panggilan TEXT,
      jenis_kelamin TEXT,
      ttl_anak TEXT,
      nik_anak TEXT,
      alamat_anak TEXT,
      agama_anak TEXT,
      nama_ortu TEXT,
      ttl_ortu TEXT,
      alamat_ortu TEXT,
      agama_ortu TEXT,
      pekerjaan_ortu TEXT,
      no_tlp_ortu TEXT,
      kk_file TEXT,
      akta_file TEXT,
      foto_file TEXT,
      kk_ortu_file TEXT,
      ktp_ortu_file TEXT,
      status TEXT
    )
  ''');
  }

  // DATABASE UPGRADE
  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // VERSION 2
    if (oldVersion < 2) {
      await db.execute('''
        CREATE TABLE IF NOT EXISTS users (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          email TEXT UNIQUE,
          phone TEXT,
          password TEXT
        )
      ''');
    }

    // VERSION 3 (ADMIN)
    if (oldVersion < 3) {
      await db.execute('''
        CREATE TABLE IF NOT EXISTS admin (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          email TEXT UNIQUE,
          password TEXT
        )
      ''');

      final adminCheck = await db.query('admin');

      if (adminCheck.isEmpty) {
        await db.insert('admin', {
          'email': 'admin@gmail.com',
          'password': 'admin123',
        });
      }
    }

    // VERSION 4 (DOKUMEN PENDAFTARAN)
    if (oldVersion < 4) {
      await db.execute("ALTER TABLE pendaftaran ADD COLUMN no_tlp_ortu TEXT");
      await db.execute("ALTER TABLE pendaftaran ADD COLUMN kk_file TEXT");
      await db.execute("ALTER TABLE pendaftaran ADD COLUMN akta_file TEXT");
      await db.execute("ALTER TABLE pendaftaran ADD COLUMN foto_file TEXT");
      await db.execute("ALTER TABLE pendaftaran ADD COLUMN kk_ortu_file TEXT");
      await db.execute("ALTER TABLE pendaftaran ADD COLUMN ktp_ortu_file TEXT");
    }
  }

  // REGISTER USER
  Future<int> registerUser(Map<String, dynamic> user) async {
    final db = await database;

    return await db.insert(
      'users',
      user,
      conflictAlgorithm: ConflictAlgorithm.abort,
    );
  }

  // LOGIN USER
  Future<Map<String, dynamic>?> loginUser(String email, String password) async {
    final db = await database;

    final result = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (result.isNotEmpty) {
      return result.first;
    }

    return null;
  }

  // LOGIN ADMIN
  Future<Map<String, dynamic>?> loginAdmin(
    String email,
    String password,
  ) async {
    final db = await database;

    final result = await db.query(
      'admin',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (result.isNotEmpty) {
      return result.first;
    }

    return null;
  }

  // CHECK EMAIL USER
  Future<bool> emailExists(String email) async {
    final db = await database;

    final result = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
    );

    return result.isNotEmpty;
  }

  // INSERT PENDAFTARAN
  Future<int> insertPendaftaran(Map<String, dynamic> row) async {
    final db = await database;

    return await db.insert('pendaftaran', row);
  }

  Future<int> updateDataOrangTua({
    required String noPendaftaran,
    required String namaOrtu,
    required String ttlOrtu,
    required String alamatOrtu,
    required String agamaOrtu,
    required String pekerjaanOrtu,
    required String noTlpOrtu,
    required String kkOrtuFile,
    required String ktpOrtuFile,
  }) async {
    final db = await database;

    return await db.update(
      'pendaftaran',
      {
        'nama_ortu': namaOrtu,
        'ttl_ortu': ttlOrtu,
        'alamat_ortu': alamatOrtu,
        'agama_ortu': agamaOrtu,
        'pekerjaan_ortu': pekerjaanOrtu,
        'no_tlp_ortu': noTlpOrtu,
        'kk_ortu_file': kkOrtuFile,
        'ktp_ortu_file': ktpOrtuFile,
      },
      where: 'no_pendaftaran = ?',
      whereArgs: [noPendaftaran],
    );
  }

  // UPDATE STATUS
  Future<int> updateStatus(String noPendaftaran, String status) async {
    final db = await database;

    return await db.update(
      'pendaftaran',
      {'status': status},
      where: 'no_pendaftaran = ?',
      whereArgs: [noPendaftaran],
    );
  }

  // GET BERDASARKAN NOMOR
  Future<List<Map<String, dynamic>>> getPendaftaranByNo(
    String noPendaftaran,
  ) async {
    final db = await database;

    return await db.query(
      'pendaftaran',
      where: 'no_pendaftaran = ?',
      whereArgs: [noPendaftaran],
    );
  }

  // GET SEMUA PENDAFTAR
  Future<List<Map<String, dynamic>>> getAllPendaftaran() async {
    final db = await database;

    return await db.query('pendaftaran', orderBy: 'id DESC');
  }
}
