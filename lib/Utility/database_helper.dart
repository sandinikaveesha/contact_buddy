

import 'dart:io';
import 'package:contact_buddy/Models/contact_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper{

  //Database Information 
  static final _databaseName = 'contactbuddy.db';
  static final _databaseVersion = 1;

  //Making DatabaseHelper as Singleton
  DatabaseHelper._privateDatabaseHelper();
  static final DatabaseHelper instance = DatabaseHelper._privateDatabaseHelper();

  static Database? _database;
  Future<Database> get database async{

    //Avoid Creating Database if exists
    if(_database != null) return _database!;

    //Creating Database
    _database = await _createDatabase();
    return _database!;
  }

  _createDatabase() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _databaseName);
    return await openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  //Initial Database
  _onCreate(Database db, int version) async{
    await db.execute('''
      CREATE TABLE ${ContactModel.tblName}(
        ${ContactModel.columnID} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${ContactModel.columnName} TEXT NOT NULL,
        ${ContactModel.columnContact} TEXT NOT NULL,
        ${ContactModel.columnEmail} TEXT,
        ${ContactModel.columnImg} TEXT

      )
    ''');
  }

  //Create Contact
  Future<int> createContact(ContactModel contact) async{
    Database db = await database;
    return await db.insert(ContactModel.tblName, contact.toMap());
  }

  //Fetch  Contact
  Future<List<Map<String, dynamic>>> getContacts() async{
    Database db = await database;
    return await db.query(ContactModel.tblName);
    //return contacts.length == 0 ? [] : contacts.map((e) => ContactModel.fromMap(e)).toList();
  }

  //Delete Contact
  Future<int> deleteContact(int id) async{
    Database db = await database;
    return await db.delete(ContactModel.tblName, where: '${ContactModel.columnID}=?', whereArgs: [id]);
  }

  //Update Contact
  Future<int> updateContact(ContactModel contact) async{
    Database db = await database; 
    return db.update(ContactModel.tblName, contact.toMap(), where: '${ContactModel.columnID}=?', whereArgs: [contact.id]);
  }
}