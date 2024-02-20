import 'package:sqflite/sqflite.dart';

import '../models/response/products_response_model.dart';

class ProductLocalDataSource{
  ProductLocalDataSource._init();

  static final ProductLocalDataSource instance = ProductLocalDataSource._init();

  final String tableProduct = "products";
  static Database? _database;

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = dbPath + filePath;

    return await openDatabase(
      path,
      version: 2,
      onCreate: _createDB
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableProduct (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        description TEXT,
        price INTEGER,
        stock INTEGER,
        image TEXT,
        is_best_seller INTEGER,
        is_sync INTEGER DEFAULT 0,
        created_at TEXT,
        updated_at TEXT
      )
    ''');
  }

  Future<Database> get database async {
    if(_database != null) return _database!;

    _database = await _initDB('pdjm.db');
    return _database!;
  }

  Future<void> removeAllDataProduct() async {
    final db = await instance.database;
    await db.delete(tableProduct);
  }

  Future<void> insertAllProduct(List<Product> products) async {
    final db = await instance.database;
    for (var product in products) {
      await db.insert(tableProduct, product.toMap());
    }
  }

  Future<List<Product>> getAllProduct() async {
    final db = await instance.database;
    final result = await db.query(tableProduct);

    return result.map((e) => Product.fromMap(e)).toList().reversed.toList();
  }

}