import 'dart:io';
import 'package:final_task_catalist/data/models/products_model.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../index_shared.dart';

class DBProvider {
  static Database? _database;
  static const String tableName = "products_table1";

  static Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  static initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, '$tableName.db');

    return await openDatabase(path, version: 154, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE $tableName('
          'id INTEGER PRIMARY KEY,'
          'productName TEXT,'
          'photoPath TEXT'
          // 'brandID INTEGER,'
          //'brandName TEXT'
          // 'languageName TEXT'
          //'categoryID INTEGER,'
          // 'categoryName TEXT'
          //'companyID INTEGER'
          //'companyName TEXT'
          ')');
      if (kDebugMode) {
        print('init Function call');
      }
    });
  }

  static createProducts(Product products) async {
    final db = await database;
    final res = await db!.insert(tableName, products.toJson());
    if (kDebugMode) {
      print('create Function call');
    }
    return res;
  }

  static Future<int> deleteAllProducts() async {
    final db = await database;
    final res = await db!.delete(tableName);
    if (kDebugMode) {
      print('delete Function call');
    }

    return res;
  }

  static Future<List<Product>> getAllProducts() async {
    final db = await database;

    final res = await db!.rawQuery("SELECT * FROM $tableName");

    if (kDebugMode) {
      print(res.length);
    }
    List<Product> list =
        res.isNotEmpty ? res.map((c) => Product.fromJson(c)).toList() : [];
    if (kDebugMode) {
      print('getAll Function call');
    }

    return list;
  }
}
