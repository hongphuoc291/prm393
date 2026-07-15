import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class AppDatabase {
  AppDatabase._();

  static final AppDatabase instance = AppDatabase._();

  static const String usersTable = 'users';
  static const String _databaseName = 'user_manager.db';
  static const int _databaseVersion = 1;

  Future<Database>? _databaseFuture;

  Future<Database> get database {
    return _databaseFuture ??= _openDatabase();
  }

  Future<Database> _openDatabase() async {
    sqfliteFfiInit();

    final databaseDirectory =
    await databaseFactoryFfi.getDatabasesPath();

    await Directory(databaseDirectory).create(
      recursive: true,
    );

    final databasePath = path.join(
      databaseDirectory,
      _databaseName,
    );

    return databaseFactoryFfi.openDatabase(
      databasePath,
      options: OpenDatabaseOptions(
        version: _databaseVersion,
        onCreate: _createDatabase,
      ),
    );
  }

  Future<void> _createDatabase(
      Database database,
      int version,
      ) async {
    await database.execute(
      '''
      CREATE TABLE $usersTable (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        full_name TEXT NOT NULL,
        email TEXT NOT NULL,
        avatar TEXT NOT NULL
      )
      ''',
    );
  }
}