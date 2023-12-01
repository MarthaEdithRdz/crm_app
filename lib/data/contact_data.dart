import 'dart:async';
import '../model/contact_model.dart';
import '../data/databasehelper.dart';

Future<int> insertContact(Contact newObj) async {
  final db = await DatabaseHelper.db.database;
  final int res = await db!.insert('contact', newObj.toJsonDB());
  return res;
}

Future<void> deleteContact(Contact delObj) async {
  final db = await DatabaseHelper.db.database;

  await db!.delete(
    'contact',
    where: 'id = ?',
    whereArgs: [delObj.id],
  );
}

Future<int> updateContact(Contact newObj) async {
  final db = await DatabaseHelper.db.database;

  final int res = await db!.update('contact', newObj.toJson(),
      where: 'id = ?', whereArgs: [newObj.id]);

  return res;
}

Future<List<Contact>> getAllContact() async {
  final db = await DatabaseHelper.db.database;

  final res = await db!.query('contact');

  return res.isEmpty ? [] : res.map((e) => Contact.fromJson(e)).toList();
}
