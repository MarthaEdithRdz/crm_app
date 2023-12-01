import 'dart:async';
import '../model/customer_model.dart';
import '../data/databasehelper.dart';

Future<int> insertCustomer(Customer newObj) async {
  final db = await DatabaseHelper.db.database;
  final int res = await db!.insert('customer', newObj.toJsonDB());
  return res;
}

Future<void> deleteCustomer(Customer delObj) async {
  final db = await DatabaseHelper.db.database;

  await db!.delete(
    'customer',
    where: 'id = ?',
    whereArgs: [delObj.id],
  );
}

Future<int> updateCustomer(Customer newObj) async {
  final db = await DatabaseHelper.db.database;

  final int res = await db!.update('customer', newObj.toJson(),
      where: 'id = ?', whereArgs: [newObj.id]);

  return res;
}

Future<List<Customer>> getAllCustomer() async {
  final db = await DatabaseHelper.db.database;

  final res = await db!.query('customer');

  return res.isEmpty ? [] : res.map((e) => Customer.fromJson(e)).toList();
}
