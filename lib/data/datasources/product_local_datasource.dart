import 'package:flutter/cupertino.dart';
import 'package:pos_bengkel/presentation/home/models/order_item.dart';
import 'package:pos_bengkel/presentation/order/models/order_model.dart';
import 'package:sqflite/sqflite.dart';
import '../models/response/products_response_model.dart';

class ProductLocalDataSource {
  ProductLocalDataSource._init();

  static final ProductLocalDataSource instance = ProductLocalDataSource._init();

  final String tableProduct = "products";
  final String tableOrder = "orders";
  final String tableOrderItem = "orders_items";
  static Database? _database;

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = dbPath + filePath;

    return await openDatabase(path, version: 7, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableProduct (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT UNIQUE,
        description TEXT,
        price INTEGER,
        stock INTEGER,
        image TEXT,
        is_best_seller INTEGER,
        created_at TEXT,
        updated_at TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE $tableOrder (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nominal INTEGER,
        total_qty INTEGER,
        total_price INTEGER,
        payment_method TEXT,
        id_cashier INTEGER,
        cashier_name TEXT,
        transaction_time TEXT,
        is_sync INTEGER DEFAULT 0
      )
    ''');

    await db.execute('''
      CREATE TABLE $tableOrderItem (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        id_order INTEGER,
        id_product INTEGER,
        quantity INTEGER,
        price INTEGER,
        FOREIGN KEY(id_order) REFERENCES orders(id),
        FOREIGN KEY(id_product) REFERENCES products(id)
      )
    ''');
  }

  Future<Database> get database async {
    if (_database != null) return _database!;

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

  Future<Product?> insertProduct(Product product) async {
    final db = await instance.database;
    int? id;
    try {
      id = await db.insert(tableProduct, product.toMap());
      return product.copyWith(id: id);
    } catch (error) {
      return null;
    }
  }

  Future<List<Product>> getAllProduct() async {
    final db = await instance.database;
    final result = await db.query(tableProduct);

    return result.map((e) => Product.fromMap(e)).toList().reversed.toList();
  }

  Future<int> saveOrder(OrderModel order) async {
    try {
      final db = await instance.database;
      int id = await db.insert(tableOrder, order.toMapSqlite());
      for (var item in order.items) {
        await db.insert(tableOrderItem, item.toMapSqlite(id));
        await reduceStockProductById(item.product.id!, item.quantity);
      }
      return id;
    } catch (error) {
      return 0;
    }
  }

  Future<int> updateIsSyncOrderById(int id) async {
    final db = await instance.database;
    return await db.update(tableOrder, {'is_sync': 1},
        where: 'id=?', whereArgs: [id]);
  }

  Future<int> reduceStockProductById(int id, int qty) async {
    final db = await instance.database;
    List<Map<String, dynamic>> foundProduct =  await db.query(tableProduct, where: 'id = ?', whereArgs: [id]);
    if(foundProduct.isNotEmpty){
      Product product = Product.fromMap(foundProduct.first);
      int stockReduced = int.parse(product.stock) - qty;
      product.stock = stockReduced.toString();
      await db.update(tableProduct, product.toMap(), where: 'id = ?', whereArgs: [id]);
      return 1;
    }else{
      return 0;
    }
  }

  Future<List<OrderModel>> getOrderNotSync() async {
    try {
      final db = await instance.database;
      final result = await db.query(tableOrder, where: 'is_sync = 0');
      return result.map((e) => OrderModel.fromSqlite(e)).toList();
    } catch (error) {
      return [];
    }
  }

  Future<List<OrderModel>> getAllOrders() async {
    try {
      final db = await instance.database;
      final result = await db.query(tableOrder, orderBy: 'id DESC');
      return result.map((e) => OrderModel.fromSqlite(e)).toList();
    } catch (error) {
      return [];
    }
  }

  Future<List<OrderItem>> getOrderItemByOrderId(int idOrder) async {
    try {
      final db = await instance.database;
      final result = await db.rawQuery('''
        SELECT * FROM $tableOrderItem INNER JOIN $tableProduct ON orders_items.id_product = products.id WHERE orders_items.id_order = $idOrder;
      ''');
      final dataList = result.map((e) => OrderItem.fromMapSqlite(e)).toList();
      return dataList;
    } catch (error) {
      return [];
    }
  }

}
