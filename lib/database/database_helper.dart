
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;

  Future<void> copyDatabaseFromAssets() async {
    // Get the application documents directory
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'data.db');

    // Check if the database already exists
    final fileExists = await File(path).exists();
    if (!fileExists) {
      // Load the database from the asset and copy it to the documents directory
      final byteData = await rootBundle.load('assets/database/data.db');
      final buffer = byteData.buffer;
      await File(path).writeAsBytes(
          buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    }
  }

  Future<Database> initializeDatabase() async {
    if (_database != null) return _database!;
    await copyDatabaseFromAssets();

    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'data.db');

    // Open the database
    _database = await openDatabase(path);
    return _database!;
  }

  // // Open the SQLite database
  // Future<Database> get database async {
  //   if (_database != null) return _database!;
  //
  //   // If the database is null, initialize it
  //   // _database = await openDatabase(
  //   //   join(await getDatabasesPath(), 'data.db'),
  //   // );
  //
  //   String databasePath = join(await getDatabasesPath(), 'data.db');
  //   print('Database path: $databasePath');
  //
  //   // If the database is null, initialize it
  //   _database = await openDatabase(databasePath);
  //
  //   return _database!;
  // }
}