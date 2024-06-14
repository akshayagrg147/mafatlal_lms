import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'database_helper.dart';

class DatabaseController extends GetxController {
  Database? database;

  @override
  void onInit() {
    super.onInit();
    initializeDatabase();
  }

  Future<void> initializeDatabase() async {
    database = await DatabaseHelper().initializeDatabase();
  }

  Future<List<Map<String, dynamic>>> query(String table,
      {String? where,
      List<Object?>? whereArgs,
      int? limit,
      String? orderBy}) async {
    if (database != null) {
      return await database!.query(table,
          where: where, whereArgs: whereArgs, limit: limit, orderBy: orderBy);
    } else {
      throw Exception("Database is not initialized");
    }
  }

  Future<int> insert(String table, Map<String, dynamic> data) async {
    if (database != null) {
      // print("in inserted3");
      return await database!.insert(table, data);
      // print("in inserted3");
    } else {
      throw Exception("Database is not initialized");
    }
  }

  Future<int> delete(String table,
      {String? where, List<Object?>? whereArgs}) async {
    return await database!.delete(table, where: where, whereArgs: whereArgs);
  }

  Future<void> performTransaction({required String query}) async {
    if (database != null) {
      await database!.transaction((txn) async {
        await txn.execute(query);
      });
      print("Perform Transaction Successfully");
    } else {
      throw Exception("Database is not initialized");
    }
  }
}

// class MyDataController extends GetxController {
//   final DatabaseHelper dbHelper = DatabaseHelper();
//
//   Future<List<Map<String, dynamic>>> fetchDataFromDatabase(String tableName) async {
//     sqfliteFfiInit();
//     databaseFactory = databaseFactoryFfi;
//     final database = await dbHelper.database;
//     return await database.query(tableName);
//   }
// }
