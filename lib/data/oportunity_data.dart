import 'dart:async';
import '../model/oportunity_model.dart';
import '../data/databasehelper.dart';

Future<int> insertOportunity(Oportunity newObj) async {
  final db = await DatabaseHelper.db.database;
  final int res = await db!.insert('oportunity', newObj.toJsonDB());
  return res;
}

Future<void> deleteOportunity(Oportunity delObj) async {
  final db = await DatabaseHelper.db.database;

  await db!.delete(
    'oportunity',
    where: 'id = ?',
    whereArgs: [delObj.id],
  );
}

Future<int> updateOportunity(Oportunity newObj) async {
  final db = await DatabaseHelper.db.database;

  final int res = await db!.update('oportunity', newObj.toJson(),
      where: 'id = ?', whereArgs: [newObj.id]);

  return res;
}

Future<List<Oportunity>> getAllOportunity() async {
  final db = await DatabaseHelper.db.database;

  final res = await db!.query('oportunity');

  return res.isEmpty ? [] : res.map((e) => Oportunity.fromJson(e)).toList();
}
