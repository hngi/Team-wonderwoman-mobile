import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


Database db;

class USER {
  int id;
  String name;
  String weight;
  String height;
  

  USER({id, @required this.name, @required this.weight, @required this.height});

  Map<String, dynamic> toMap() {
    return {
      UsersManager.id:id,
      UsersManager.name: name,
      UsersManager.weight: weight,
      UsersManager.height: height,
     
    };
  }

  factory USER.fromJson(Map<String, dynamic> json) {
    return new USER(
        id: json[UsersManager.id],
        name: json[UsersManager.name],
        weight: json[UsersManager.weight],
        height: json[UsersManager.height],
        );
          }
}


class UsersManager {
  Database _database;
  static const databaseName = 'Users.db';
  static const usersTable = 'users';
  static const id = 'id';
  static const name = 'name';
  static const weight = 'weight';
  static const height = 'height';
  


  Future openDB() async {
    if (_database == null) {
      _database = await openDatabase(join(await getDatabasesPath(), UsersManager.databaseName), version: 1,
          onCreate: (Database db, int version) async {
        await db.execute("CREATE TABLE users ("
          "id INTEGER PRIMARYKEY,"          
            "name TEXT,"
            "weight INTEGER,"
            "height INTEGER,"          
            ")");
      });
    }
  }

  Future<int> insertUsers(USER user ) async {
    await openDB();
    return await _database.insert(UsersManager.usersTable, user.toMap());
  }

  

}