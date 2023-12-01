import 'dart:async';
import '../model/reminder_model.dart';
import '../data/databasehelper.dart';

Future<int> insertReminder(Reminder newObj) async {
  final db = await DatabaseHelper.db.database;
  final int res = await db!.insert('reminder', newObj.toJsonDB());
  return res;
}

Future<void> deleteReminder(Reminder delObj) async {
  final db = await DatabaseHelper.db.database;

  await db!.delete(
    'reminder',
    where: 'id = ?',
    whereArgs: [delObj.id],
  );
}

Future<int> updateReminder(Reminder newObj) async {
  final db = await DatabaseHelper.db.database;

  final int res = await db!.update('reminder', newObj.toJson(),
      where: 'id = ?', whereArgs: [newObj.id]);

  return res;
}

Future<List<Reminder>> getAllReminder() async {
  final db = await DatabaseHelper.db.database;

  final res = await db!.query('reminder');

  return res.isEmpty ? [] : res.map((e) => Reminder.fromJson(e)).toList();
}
