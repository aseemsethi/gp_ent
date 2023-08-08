import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import '../models/vpcModel.dart';

class DatabaseHelper {
  // with ChangeNotifier {
  static final _databaseName = "gpsecurity.db";
  static final _databaseVersion = 1;
  static final table = 'gptable';

  String? path;
  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _database = null;
  Future<Database?> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  /*
   On IOS: initDatabase: path to DB:/Users/aseemsethi/Library/Developer/
   CoreSimulator/Devices/A19D7E26-FDF7-4017-9A0B-EB67356D2705/data/Containers/
   Data/Application/F6284ACA-71F6-41B7-BD41-8A146C4AE805/Documents/gpsecurity.db

   On Android: DB initDatabase: path to DB:/data/user/0/com.aseem.gp_ent/
   app_flutter/gpsecurity.db
   */
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    path = join(documentsDirectory.path, _databaseName);
    print('DB initDatabase: path to DB:$path');
    return await openDatabase(
      path!,
      version: _databaseVersion,
      onCreate: _onCreate,
      readOnly: false,
    );
  }

  // SQL code to create the database table
  //  DB initDatabase: path to DB:/data/user/0/com.example.my_app/app_flutter/seccomply.db
  Future _onCreate(Database db, int version) async {
    print('DB: onCreate called.....');
    await db.execute('''
          CREATE TABLE $table (
            vpcName TEXT PRIMARY KEY,
            cloudName TEXT,
            accessKeyId TEXT,
            secretAccessKey TEXT,
            region TEXT
          )
          ''');
  }

  clean() async {
    print('DB: dbhelper: removed DB');
    await deleteDatabase(path!);
  }

  Future<int> insertVpc(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    int ret = 0;
    try {
      ret = await db!.insert(table, row);
    } on DatabaseException catch (e) {
      print("DB: Exception $e");
      if (e.toString().contains('1555')) {
        print("DB: Primary key error");
        return 99;
      }
    }
    return ret;
  }

  // UPDATE - SET city = 'Toronto', state = 'ON' WHERE employeeid = 4;
  Future<int> updateVpc(DBModel item) async {
    int ret = 0;
    Database? db = await instance.database;
    return db!.insert(
      table,
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<DBModel>> fetchDB() async {
    //returns the DB as a list (array)
    Database? db = await instance.database;
    final maps = await db!
        .query(table); //query all the rows in a table as an array of maps

    return List.generate(maps.length, (i) {
      return DBModel(
        vpcName: maps[i]['vpcName'].toString(),
        cloudName: maps[i]['cloudName'].toString(),
        accessKeyId: maps[i]['accessKeyId'].toString(),
        secretAccessKey: maps[i]['secretAccessKey'].toString(),
        region: maps[i]['region'].toString(),
      );
    });
  }

  Future<DBModel> getVpc(String name) async {
    //returns the DB as a list (array)
    Database? db = await instance.database;
    final maps = await db!
        .query(table); //query all the rows in a table as an array of maps

    for (var i = 0; i < maps.length; i++) {
      if (maps[i]['vpcName'].toString().contains(name)) {
        return DBModel(
          vpcName: maps[i]['vpcName'].toString(),
          cloudName: maps[i]['cloudName'].toString(),
          accessKeyId: maps[i]['accessKeyId'].toString(),
          secretAccessKey: maps[i]['secretAccessKey'].toString(),
          region: maps[i]['region'].toString(),
        );
      }
    }
    return DBModel(
        vpcName: "",
        cloudName: "",
        accessKeyId: "",
        secretAccessKey: "",
        region: "");
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database? db = await instance.database;
    return await db!.query(table);
  }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int?> queryRowCount() async {
    Database? db = await instance.database;
    return Sqflite.firstIntValue(
        await db!.rawQuery('SELECT COUNT(*) FROM $table'));
  }
}
