import '../database/app_database.dart';
import '../models/user.dart';
import 'user_repository.dart';

class SqliteUserRepository implements UserRepository {
  SqliteUserRepository({
    AppDatabase? appDatabase,
  }) : _appDatabase = appDatabase ?? AppDatabase.instance;

  final AppDatabase _appDatabase;

  @override
  Future<List<UserModel>> getUsers() async {
    final database = await _appDatabase.database;

    final results = await database.query(
      AppDatabase.usersTable,
      orderBy: 'id ASC',
    );

    return results
        .map(UserModel.fromMap)
        .toList();
  }

  @override
  Future<void> addUser(UserModel user) async {
    final database = await _appDatabase.database;

    await database.insert(
      AppDatabase.usersTable,
      user.toMap(),
    );
  }

  @override
  Future<void> updateUser(UserModel user) async {
    final database = await _appDatabase.database;

    await database.update(
      AppDatabase.usersTable,
      user.toMap(),
      where: 'id = ?',
      whereArgs: <Object>[user.id],
    );
  }

  @override
  Future<void> deleteUser(int id) async {
    final database = await _appDatabase.database;

    await database.delete(
      AppDatabase.usersTable,
      where: 'id = ?',
      whereArgs: <Object>[id],
    );
  }
}