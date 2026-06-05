import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

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

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
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

  Future<int> insertPendaftaran(Map<String, dynamic> row) async {
    final db = await database;
    return await db.insert('pendaftaran', row);
  }

  Future<int> updateStatus(String noPendaftaran, String status) async {
    final db = await database;
    return await db.update(
      'pendaftaran',
      {'status': status},
      where: 'no_pendaftaran = ?',
      whereArgs: [noPendaftaran],
    );
  }

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

  Future<List<Map<String, dynamic>>> getAllPendaftaran() async {
    final db = await database;

    return await db.query('pendaftaran', orderBy: 'id DESC');
  }
}
