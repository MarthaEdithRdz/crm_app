// Script for create table user
// We suggest to use the file: databasehelper.dart

import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _database;

  static final DatabaseHelper db = DatabaseHelper._();
  DatabaseHelper._();

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'dbApp.sqlite');

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      db.execute('''
			CREATE TABLE user
			(
			id integer PRIMARY KEY AUTOINCREMENT,
			name text,
			email text,
			password text);
			 ''');

      db.execute('''
			CREATE TABLE customer
			(
			id integer PRIMARY KEY AUTOINCREMENT,
			name text,
			rfc text,
			web text,
			comment text);
			 ''');

      db.execute('''
			CREATE TABLE contact
			(
			id integer PRIMARY KEY AUTOINCREMENT,
			name text,
			position text,
			phone text,
			email text,
			comment text,
			birthday integer,
			birthmonth integer,
			customerid integer);
			 ''');

      db.execute('''
			CREATE TABLE oportunity
			(
			id integer PRIMARY KEY AUTOINCREMENT,
			description text,
			comments text,
			amount integer,
			customerid integer);
			 ''');

      db.execute('''
			CREATE TABLE reminder
			(
			id integer PRIMARY KEY AUTOINCREMENT,
			name text,
			comment text,
			status integer);
			 ''');
    });
  }
}
