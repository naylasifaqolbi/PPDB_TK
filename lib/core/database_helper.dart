import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDB('ppdb.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 2, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    // ==========================
    // TABLE USERS (LOGIN)
    // ==========================
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        email TEXT UNIQUE,
        phone TEXT,
        password TEXT
      )
    ''');

    // ==========================
    // TABLE PENDAFTARAN PPDB
    // ==========================
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
        status TEXT
      )
    ''');
  }

  // =====================================================
  // REGISTER USER
  // =====================================================

  Future<int> registerUser(Map<String, dynamic> user) async {
    final db = await database;

    return await db.insert(
      'users',
      user,
      conflictAlgorithm: ConflictAlgorithm.abort,
    );
  }

  // =====================================================
  // LOGIN USER
  // =====================================================

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

  // =====================================================
  // CHECK EMAIL SUDAH ADA
  // =====================================================

  Future<bool> emailExists(String email) async {
    final db = await database;

    final result = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
    );

    return result.isNotEmpty;
  }

  // =====================================================
  // INSERT DATA PENDAFTARAN
  // =====================================================

  Future<int> insertPendaftaran(Map<String, dynamic> row) async {
    final db = await database;

    return await db.insert('pendaftaran', row);
  }

  // =====================================================
  // UPDATE STATUS PENDAFTARAN
  // =====================================================

  Future<int> updateStatus(String noPendaftaran, String status) async {
    final db = await database;

    return await db.update(
      'pendaftaran',
      {'status': status},
      where: 'no_pendaftaran = ?',
      whereArgs: [noPendaftaran],
    );
  }

  // =====================================================
  // GET DATA BERDASARKAN NOMOR PENDAFTARAN
  // =====================================================

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

  // =====================================================
  // GET SEMUA PENDAFTAR
  // =====================================================

  Future<List<Map<String, dynamic>>> getAllPendaftaran() async {
    final db = await database;

    return await db.query('pendaftaran', orderBy: 'id DESC');
  }
}
