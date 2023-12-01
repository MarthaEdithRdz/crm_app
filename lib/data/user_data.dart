// Model generates for Felipe's Programs
// We suggest to use the file: user_data.dart

import 'dart:async';
import '../model/user_model.dart';
import '../data/databasehelper.dart';

Future<int> insertUser(User newObj) async {
  final db = await DatabaseHelper.db.database;
  final int res = await db!.insert('user', newObj.toJsonDB());
  return res;
}

Future<void> deleteUser(User delObj) async {
  final db = await DatabaseHelper.db.database;

  await db!.delete(
    'user',
    where: 'id = ?',
    whereArgs: [delObj.id],
  );
}

Future<int> updateUser(User newObj) async {
  final db = await DatabaseHelper.db.database;

  final int res = await db!
      .update('user', newObj.toJson(), where: 'id = ?', whereArgs: [newObj.id]);

  return res;
}

Future<List<User>> getAllUser() async {
  final db = await DatabaseHelper.db.database;

  final res = await db!.query('user');

  return res.isEmpty ? [] : res.map((e) => User.fromJson(e)).toList();
}

Future<List<User>> getUserByEmail(String email) async {
  final db = await DatabaseHelper.db.database;

  final res = await db!.query(
      "SELECT id, name, email, password FROM user  user where email = '$email'");

  return res.isEmpty ? [] : res.map((e) => User.fromJson(e)).toList();
}
